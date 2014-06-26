require 'delegate'

module Lotus
  module Utils
    # Hash on steroids
    # @since 0.1.0
    class Hash < DelegateClass(::Hash)
      # Initialize the hash
      #
      # @param hash [::Hash, Hash] the value we want to use to initialize this instance
      #
      # @return [Hash] self
      #
      # @since 0.1.0
      def initialize(hash = {})
        super
        merge! hash
      end

      # Convert in-place all the keys to Symbol instances, nested hashes are converted too.
      #
      # @return [Hash] self
      #
      # @since 0.1.0
      #
      # @example
      #   require 'lotus/utils/hash'
      #
      #   hash = Lotus::Utils::Hash.new 'a' => 23, 'b' => { 'c' => ['x','y','z'] }
      #   hash.symbolize!
      #
      #   hash.keys    # => [:a, :b]
      #   hash.inspect # => {:a=>23, :b=>{:c=>["x", "y", "z"]}}
      def symbolize!
        keys.each do |k|
          v = delete(k)
          v = Hash.new(v).symbolize! if v.is_a?(::Hash)

          self[k.to_sym] = v
        end

        self
      end
    end
  end
end
