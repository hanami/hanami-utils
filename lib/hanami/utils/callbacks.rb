# frozen_string_literal: true

require "concurrent/array"
require "dry/core"

module Hanami
  module Utils
    # Before and After callbacks
    #
    # @since 0.1.0
    # @private
    module Callbacks
      # Series of callbacks to be executed
      #
      # @since 0.1.0
      # @private
      class Chain
        include Dry.Equalizer(:chain)

        # Returns a new chain
        #
        # @return [Hanami::Utils::Callbacks::Chain]
        #
        # @since 0.2.0
        def initialize
          @chain = Concurrent::Array.new
        end

        # Appends the given callbacks to the end of the chain.
        #
        # @param callbacks [Array] one or multiple callbacks to append
        # @param block [Proc] an optional block to be appended
        #
        # @return [void]
        #
        # @raise [RuntimeError] if the object was previously frozen
        #
        # @see #prepend
        # @see #run
        # @see Hanami::Utils::Callbacks::Callback
        # @see Hanami::Utils::Callbacks::MethodCallback
        # @see Hanami::Utils::Callbacks::Chain#freeze
        #
        # @since 0.3.4
        #
        # @example
        #   require 'hanami/utils/callbacks'
        #
        #   chain = Hanami::Utils::Callbacks::Chain.new
        #
        #   # Append a Proc to be used as a callback, it will be wrapped by `Callback`
        #   # The optional argument(s) correspond to the one passed when invoked the chain with `run`.
        #   chain.append { Authenticator.authenticate! }
        #   chain.append { |params| ArticleRepository.new.find(params[:id]) }
        #
        #   # Add a callable that isn't a proc, and it will be wrapped by `Callback` as well.
        #   module LivenessProbeCallback
        #     extend self
        #
        #     def call = LivenessProbe.alive!
        #   end
        #
        #   chain.append LivenessProbeCallback
        #
        #   # Append a Symbol as a reference to a method name that will be used as a callback.
        #   # It will wrapped by `MethodCallback`
        #   # If the #notificate method accepts some argument(s) they should be passed when `run` is invoked.
        #   chain.append :notificate
        def append(*callbacks, &block)
          callables(callbacks, block).each do |c|
            @chain.push(c)
          end

          @chain.uniq!
        end

        # Prepends the given callbacks to the beginning of the chain.
        #
        # @param callbacks [Array] one or multiple callbacks to add
        # @param block [Proc] an optional block to be added
        #
        # @return [void]
        #
        # @raise [RuntimeError] if the object was previously frozen
        #
        # @see #append
        # @see #run
        # @see Hanami::Utils::Callbacks::Callback
        # @see Hanami::Utils::Callbacks::MethodCallback
        # @see Hanami::Utils::Callbacks::Chain#freeze
        #
        # @since 0.3.4
        #
        # @example
        #   require 'hanami/utils/callbacks'
        #
        #   chain = Hanami::Utils::Callbacks::Chain.new
        #
        #   # Add a Proc to be used as a callback, it will be wrapped by `Callback`
        #   # The optional argument(s) correspond to the one passed when invoked the chain with `run`.
        #   chain.prepend { Authenticator.authenticate! }
        #   chain.prepend { |params| ArticleRepository.new.find(params[:id]) }
        #
        #   # Add a callable that isn't a proc, and it will be wrapped by `Callback` as well.
        #   module LivenessProbeCallback
        #     extend self
        #
        #     def call = LivenessProbe.alive!
        #   end
        #
        #   chain.prepend LivenessProbeCallback
        #
        #   # Add a Symbol as a reference to a method name that will be used as a callback.
        #   # It will wrapped by `MethodCallback`
        #   # If the #notificate method accepts some argument(s) they should be passed when `run` is invoked.
        #   chain.prepend :notificate
        def prepend(*callbacks, &block)
          callables(callbacks, block).each do |c|
            @chain.unshift(c)
          end

          @chain.uniq!
        end

        # Runs all the callbacks in the chain.
        # The only two ways to stop the execution are: `raise` or `throw`.
        #
        # @param context [Object] the context where we want the chain to be invoked.
        # @param args [Array] the arguments that we want to pass to each single callback.
        #
        # @since 0.1.0
        #
        # @example
        #   require 'hanami/utils/callbacks'
        #
        #   class Action
        #     private
        #     def authenticate!
        #     end
        #
        #     def set_article(params)
        #     end
        #   end
        #
        #   action = Action.new
        #   params = Hash[id: 23]
        #
        #   chain = Hanami::Utils::Callbacks::Chain.new
        #   chain.append :authenticate!, :set_article
        #
        #   chain.run(action, params)
        #
        #   # `params` will only be passed as #set_article argument, because it has an arity greater than zero
        #
        #
        #
        #   chain = Hanami::Utils::Callbacks::Chain.new
        #
        #   chain.append do
        #     # some authentication logic
        #   end
        #
        #   chain.append do |params|
        #     # some other logic that requires `params`
        #   end
        #
        #   chain.append SomeEncapsulatedLogic.new # if `call` takes arguments, it will get passed params
        #
        #   chain.run(action, params)
        #
        #   Those callbacks will be invoked within the context of `action`.
        def run(context, *args)
          @chain.each do |callback|
            callback.call(context, *args)
          end
        end

        # Return a duplicate callbacks chain
        #
        # @return [Hanami::Utils::Callbacks] the duplicated chain
        #
        # @since 2.0.0
        def dup
          super.tap do |instance|
            instance.instance_variable_set(:@chain, instance.chain.dup)
          end
        end

        # It freezes the object by preventing further modifications.
        #
        # @since 0.2.0
        #
        # @see http://ruby-doc.org/core/Object.html#method-i-freeze
        #
        # @example
        #   require 'hanami/utils/callbacks'
        #
        #   chain = Hanami::Utils::Callbacks::Chain.new
        #   chain.freeze
        #
        #   chain.frozen?  # => true
        #
        #   chain.append :authenticate! # => RuntimeError
        def freeze
          super
          @chain.freeze
        end

        protected

        attr_reader :chain

        private

        # @api private
        def callables(callbacks, block)
          callbacks.push(block) if block
          callbacks.map { |c| Factory.fabricate(c) }
        end
      end

      # Callback factory
      #
      # @since 0.1.0
      # @api private
      class Factory
        # Instantiates a `Callback` according to if it responds to #call.
        #
        # @param callback [Object] the object that needs to be wrapped
        #
        # @return [Callback, MethodCallback]
        #
        # @since 0.1.0
        #
        # @example
        #   require 'hanami/utils/callbacks'
        #
        #   callable = Proc.new {} # it responds to #call
        #   method   = :upcase     # it doesn't respond to #call
        #
        #   Hanami::Utils::Callbacks::Factory.fabricate(callable).class
        #     # => Hanami::Utils::Callbacks::Callback
        #
        #   Hanami::Utils::Callbacks::Factory.fabricate(method).class
        #     # => Hanami::Utils::Callbacks::MethodCallback
        def self.fabricate(callback)
          if callback.respond_to?(:call)
            Callback.new(callback)
          else
            MethodCallback.new(callback)
          end
        end
      end

      # Proc and other callable callback.
      #
      # It wraps an object that responds to #call
      #
      # @since 0.1.0
      # @api private
      class Callback
        include Dry.Equalizer(:callback)

        # @api private
        attr_reader :callback

        # Initialize by wrapping the given callback
        #
        # @param callback [Object] the original callback that needs to be wrapped
        #
        # @return [Callback] self
        #
        # @since 0.1.0
        # @api private
        def initialize(callback)
          @callback = callback
        end

        # Executes the callback within the given context and passing the given arguments.
        #
        # @param context [Object] the context within we want to execute the callback.
        # @param args [Array] an array of arguments that will be available within the execution.
        #
        # @return [void, Object] It may return a value, it depends on the callback.
        #
        # @since 0.1.0
        # @api private
        #
        # @see Hanami::Utils::Callbacks::Chain#run
        def call(context, *args)
          callback_proc =
            if callback.respond_to?(:to_proc)
              # Procs and 100% compatibles
              callback
            else
              # Anything else that is callable
              # NB: we convert to a proc because it's basically free and
              # simplifies the code below, see: https://github.com/ruby/ruby/blob/973c45fcb3eb56df4f13d6aa54499e6ccb02809a/proc.c#L4204
              callback.method(:call).to_proc
            end

          # Procs don't enforce arity, but lambdas and methods converted to procs do
          if callback_proc.lambda?
            context.instance_exec(*args.take(callback_proc.arity), &callback_proc)
          else
            context.instance_exec(*args, &callback_proc)
          end
        end
      end

      # Method callback
      #
      # It wraps a symbol or a string representing a method name that is
      # implemented by the context within it will be called.
      #
      # @since 0.1.0
      # @api private
      class MethodCallback < Callback
        # Executes the callback within the given context and eventually passing the given arguments.
        # Those arguments will be passed according to the arity of the target method.
        #
        # @param context [Object] the context within we want to execute the callback.
        # @param args [Array] an array of arguments that will be available within the execution.
        #
        # @return [void, Object] It may return a value, it depends on the callback.
        #
        # @since 0.1.0
        # @api private
        #
        # @see Hanami::Utils::Callbacks::Chain#run
        def call(context, *args)
          method = context.method(callback)

          if method.parameters.any?
            method.call(*args)
          else
            method.call
          end
        end

        # @api private
        def hash
          callback.hash
        end

        # @api private
        def eql?(other)
          hash == other.hash
        end
      end
    end
  end
end
