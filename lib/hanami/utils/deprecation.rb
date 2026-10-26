# frozen_string_literal: true

require "hanami/utils"

module Hanami
  module Utils
    # Prints a deprecation warning when initialized
    #
    # @since 0.3.1
    class Deprecation
      # Initialize a deprecation message and prints it to standard error.
      #
      # @param message [#to_s] a deprecation message
      #
      # @since 0.3.1
      #
      # @example Direct usage
      #   require 'hanami/utils/deprecation'
      #
      #   class Engine
      #     def old_method
      #       Hanami::Utils::Deprecation.new('old_method is deprecated, please use new_method')
      #       new_method
      #     end
      #
      #     def new_method
      #       puts 'started'
      #     end
      #   end
      #
      #   Engine.new.old_method
      #     # => old_method is deprecated, please use new_method - called from: test.rb:14:in `<main>'.
      #     # => started
      #
      # @example Indirect usage
      #   require 'hanami/utils/deprecation'
      #
      #   class Engine
      #     def old_method
      #       Hanami::Utils::Deprecation.new('old_method is deprecated, please use new_method')
      #       new_method
      #     end
      #
      #     def new_method
      #       puts 'started'
      #     end
      #   end
      #
      #   class Car
      #     def initialize
      #       @engine = Engine.new
      #     end
      #
      #     def start
      #       @engine.old_method
      #     end
      #   end
      #
      #   Car.new.start
      #     # => old_method is deprecated, please use new_method - called from: test.rb:20:in `start'.
      #     # => started
      def initialize(message)
        # Some Rubies include a frame for our own `.new` call at the top of the stack and some do
        # not. Skip it if it's present (detect it through the frame having the same path and line as
        # the frame after it). After that, the first frame is the deprecated method, and the next is
        # its caller.
        locations = caller_locations
        first, second = locations
        if first.base_label == "new" && first.path == second.path && first.lineno == second.lineno
          locations.shift
        end

        ::Kernel.warn("#{message} - called from: #{locations[1]}.")
      end
    end
  end
end
