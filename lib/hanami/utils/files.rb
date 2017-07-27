require "pathname"
require "fileutils"

module Hanami
  module Utils
    # Files utilities
    #
    # @since x.x.x
    module Files # rubocop:disable Metrics/ModuleLength
      # Creates an empty file for the given path.
      # All the intermediate directories are created.
      # If the path already exists, it doesn't change the contents
      #
      # @param path [String,Pathname] the path to file
      #
      # @since x.x.x
      def self.touch(path)
        write(path, "")
      end

      # Creates a new file for the given path and content.
      # All the intermediate directories are created.
      # If the path already exists, it appends the contents.
      #
      # @param path [String,Pathname] the path to file
      # @param content [String, Array<String>] the content to write
      #
      # @since x.x.x
      def self.write(path, *content)
        mkdir_p(path)
        open(path, ::File::CREAT | ::File::WRONLY, *content)
      end

      # Rewrites the contents of an existing file.
      # If the path already exists, it replaces the contents.
      #
      # @param path [String,Pathname] the path to file
      # @param content [String, Array<String>] the content to write
      #
      # @raises [Errno::ENOENT] if the path doesn't exist
      #
      # @since x.x.x
      def self.rewrite(path, *content)
        open(path, ::File::TRUNC | ::File::WRONLY, *content)
      end

      # Copies source into destination.
      # All the intermediate directories are created.
      # If the destination already exists, it overrides the contents.
      #
      # @param source [String,Pathname] the path to the source file
      # @param destination [String,Pathname] the path to the destination file
      #
      # @since x.x.x
      def self.cp(source, destination)
        mkdir_p(destination)
        FileUtils.cp(source, destination)
      end

      # Creates a directory for the given path.
      # It assumes that all the tokens in `path` are meant to be a directory.
      # All the intermediate directories are created.
      #
      # @param path [String,Pathname] the path to directory
      #
      # @since x.x.x
      #
      # @see .mkdir_p
      #
      # @example
      #   require "hanami/utils/files"
      #
      #   Hanami::Utils::Files.mkdir("path/to/directory")
      #     # => creates the `path/to/directory` directory
      #
      #   # WRONG this isn't probably what you want, check `.mkdir_p`
      #   Hanami::Utils::Files.mkdir("path/to/file.rb")
      #     # => creates the `path/to/file.rb` directory
      def self.mkdir(path)
        FileUtils.mkdir_p(path)
      end

      # Creates a directory for the given path.
      # It assumes that all the tokens, but the last, in `path` are meant to be
      # a directory, whereas the last is meant to be a file.
      # All the intermediate directories are created.
      #
      # @param path [String,Pathname] the path to directory
      #
      # @since x.x.x
      #
      # @see .mkdir
      #
      # @example
      #   require "hanami/utils/files"
      #
      #   Hanami::Utils::Files.mkdir_p("path/to/file.rb")
      #     # => creates the `path/to` directory, but NOT `file.rb`
      #
      #   # WRONG it doesn't create the last directory, check `.mkdir`
      #   Hanami::Utils::Files.mkdir_p("path/to/directory")
      #     # => creates the `path/to` directory
      def self.mkdir_p(path)
        Pathname.new(path).dirname.mkpath
      end

      # Deletes given path (file).
      #
      # @param path [String,Pathname] the path to file
      #
      # @raises [Errno::ENOENT] if the path doesn't exist
      #
      # @since x.x.x
      def self.delete(path)
        FileUtils.rm(path)
      end

      # Deletes given path (directory).
      #
      # @param path [String,Pathname] the path to file
      #
      # @raises [Errno::ENOENT] if the path doesn't exist
      #
      # @since x.x.x
      def self.delete_directory(path)
        FileUtils.remove_entry_secure(path)
      end

      # Adds a new line at the top of the file
      #
      # @param path [String,Pathname] the path to file
      # @param line [String] the line to add
      #
      # @raises [Errno::ENOENT] if the path doesn't exist
      #
      # @see .append
      #
      # @since x.x.x
      def self.unshift(path, line)
        content = ::File.readlines(path)
        content.unshift("#{line}\n")

        rewrite(path, content)
      end

      # Adds a new line at the bottom of the file
      #
      # @param path [String,Pathname] the path to file
      # @param line [String] the line to add
      #
      # @raises [Errno::ENOENT] if the path doesn't exist
      #
      # @see .unshift
      #
      # @since x.x.x
      def self.append(path, contents)
        mkdir_p(path)

        content = ::File.readlines(path)
        content << "#{contents}\n"

        rewrite(path, content)
      end

      # Replace first line in `path` that contains `target` with `replacement`.
      #
      # @param path [String,Pathname] the path to file
      # @param target [String,Regexp] the target to replace
      # @param replacement [String] the replacement
      #
      # @raises [Errno::ENOENT] if the path doesn't exist
      # @raises [ArgumentError] if `target` cannot be found in `path`
      #
      # @see .replace_last_line
      #
      # @since x.x.x
      def self.replace_first_line(path, target, replacement)
        content = ::File.readlines(path)
        content[index(content, path, target)] = "#{replacement}\n"

        rewrite(path, content)
      end

      # Replace last line in `path` that contains `target` with `replacement`.
      #
      # @param path [String,Pathname] the path to file
      # @param target [String,Regexp] the target to replace
      # @param replacement [String] the replacement
      #
      # @raises [Errno::ENOENT] if the path doesn't exist
      # @raises [ArgumentError] if `target` cannot be found in `path`
      #
      # @see .replace_first_line
      #
      # @since x.x.x
      def self.replace_last_line(path, target, replacement)
        content = ::File.readlines(path)
        content[-index(content.reverse, path, target) - 1] = "#{replacement}\n"

        rewrite(path, content)
      end

      # Inject `contents` in `path` before `target`.
      #
      # @param path [String,Pathname] the path to file
      # @param target [String,Regexp] the target to replace
      # @param contents [String] the contents to inject
      #
      # @raises [Errno::ENOENT] if the path doesn't exist
      # @raises [ArgumentError] if `target` cannot be found in `path`
      #
      # @see .inject_line_after
      #
      # @since x.x.x
      def self.inject_line_before(path, target, contents)
        content = ::File.readlines(path)
        i       = index(content, path, target)

        content.insert(i, "#{contents}\n")
        rewrite(path, content)
      end

      # Inject `contents` in `path` after `target`.
      #
      # @param path [String,Pathname] the path to file
      # @param target [String,Regexp] the target to replace
      # @param contents [String] the contents to inject
      #
      # @raises [Errno::ENOENT] if the path doesn't exist
      # @raises [ArgumentError] if `target` cannot be found in `path`
      #
      # @see .inject_line_before
      #
      # @since x.x.x
      def self.inject_line_after(path, target, contents)
        content = ::File.readlines(path)
        i       = index(content, path, target)

        content.insert(i + 1, "#{contents}\n")
        rewrite(path, content)
      end

      # Removes line from `path`, matching `target`.
      #
      # @param path [String,Pathname] the path to file
      # @param target [String,Regexp] the target to remove
      #
      # @raises [Errno::ENOENT] if the path doesn't exist
      # @raises [ArgumentError] if `target` cannot be found in `path`
      #
      # @since x.x.x
      def self.remove_line(path, target)
        content = ::File.readlines(path)
        i       = index(content, path, target)

        content.delete_at(i)
        rewrite(path, content)
      end

      # Removes `target` block from `path`
      #
      # @param path [String,Pathname] the path to file
      # @param target [String] the target block to remove
      #
      # @raises [Errno::ENOENT] if the path doesn't exist
      # @raises [ArgumentError] if `target` cannot be found in `path`
      #
      # @since x.x.x
      #
      # @example
      #   require "hanami/utils/files"
      #
      #   puts File.read("app.rb")
      #
      #   # class App
      #   #   configure do
      #   #     root __dir__
      #   #   end
      #   # end
      #
      #   Hanami::Utils::Files.remove_block("app.rb", "configure")
      #
      #   puts File.read("app.rb")
      #
      #   # class App
      #   # end
      def self.remove_block(path, target) # rubocop:disable Metrics/AbcSize
        content  = ::File.readlines(path)
        starting = index(content, path, target)
        line     = content[starting]
        size     = line[/\A[[:space:]]*/].bytesize
        closing  = (" " * size) + (target =~ /{/ ? '}' : 'end')
        ending   = starting + index(content[starting..-1], path, closing)

        content.slice!(starting..ending)
        rewrite(path, content)

        remove_block(path, target) if match?(content, target)
      end

      # Checks if `path` exist
      #
      # @param path [String,Pathname] the path to file
      #
      # @returns [TrueClass,FalseClass] the result of the check
      #
      # @since x.x.x
      #
      # @example
      #   require "hanami/utils/files"
      #
      #   Hanami::Utils::Files.exist?(__FILE__) # => true
      #   Hanami::Utils::Files.exist?(__dir__)  # => true
      #
      #   Hanami::Utils::Files.exist?("missing_file") # => false
      def self.exist?(path)
        File.exist?(path)
      end

      # Checks if `path` is a directory
      #
      # @param path [String,Pathname] the path to directory
      #
      # @returns [TrueClass,FalseClass] the result of the check
      #
      # @since x.x.x
      #
      # @example
      #   require "hanami/utils/files"
      #
      #   Hanami::Utils::Files.directory?(__dir__)  # => true
      #   Hanami::Utils::Files.directory?(__FILE__) # => false
      #
      #   Hanami::Utils::Files.directory?("missing_directory") # => false
      def self.directory?(path)
        File.directory?(path)
      end

      # private

      # @since x.x.x
      # @api private
      def self.match?(content, target)
        !line_number(content, target).nil?
      end

      private_class_method :match?

      # @since x.x.x
      # @api private
      def self.open(path, mode, *content)
        ::File.open(path, mode) do |file|
          file.write(Array(content).flatten.join)
        end
      end

      private_class_method :open

      # @since x.x.x
      # @api private
      def self.index(content, path, target)
        line_number(content, target) or
          raise ArgumentError.new("Cannot find `#{target}' inside `#{path}'.")
      end

      private_class_method :index

      # @since x.x.x
      # @api private
      def self.line_number(content, target)
        content.index do |l|
          case target
          when ::String
            l.include?(target)
          when Regexp
            l =~ target
          end
        end
      end

      private_class_method :line_number
    end
  end
end
