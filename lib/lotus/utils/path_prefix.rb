require 'delegate'

module Lotus
  module Utils
    # Prefixed string
    #
    # @since 0.1.0
    class PathPrefix < DelegateClass(::String)
      # Initialize the path prefix
      #
      # @param string [::String] the prefix value
      # @param separator [::String] the separator used between tokens
      #
      # @return [PathPrefix] self
      #
      # @since 0.1.0
      def initialize(string = nil, separator = '/')
        @separator = separator
        super(string.to_s)
      end

      # Joins self with the given token.
      # It cleanups the all the `separator` repetitions.
      #
      # @param string [::String] the token we want to join
      #
      # @return [::String] the joined string
      #
      # @since 0.1.0
      #
      # @example
      #   require 'lotus/utils/path_prefix'
      #
      #   path_prefix = Lotus::Utils::PathPrefix.new '/posts'
      #   path_prefix.join 'new'  # => '/posts/new'
      #   path_prefix.join '/new' # => '/posts/new'
      #
      #   path_prefix = Lotus::Utils::PathPrefix.new 'posts'
      #   path_prefix.join 'new'  # => '/posts/new'
      #   path_prefix.join '/new' # => '/posts/new'
      def join(string)
        absolutize relative_join(string)
      end

      # Joins self with the given token, without prefixing it with `separator`.
      # It cleanups the all the `separator` repetitions.
      #
      # @param string [::String] the token we want to join
      # @param separator [::String] the separator used between tokens
      #
      # @return [::String] the joined string
      #
      # @since 0.1.0
      #
      # @example
      #   require 'lotus/utils/path_prefix'
      #
      #   path_prefix = Lotus::Utils::PathPrefix.new 'posts'
      #   path_prefix.relative_join 'new'      # => 'posts/new'
      #   path_prefix.relative_join 'new', '_' # => 'posts_new'
      def relative_join(string, separator = @separator)
        separator = separator || @separator
        relativize [self, string].join(separator), separator
      end

      private
      attr_reader :separator

      def absolutize(string)
        string.tap do |s|
          s.insert(0, separator) unless absolute?(s)
        end
      end

      def absolute?(string)
        string.start_with?(separator)
      end

      def relativize(string, separator = @separator)
        string.
          gsub(%r{(?<!:)#{ separator * 2 }}, separator).
          gsub(%r{\A#{ separator }}, '')
      end
    end
  end
end
