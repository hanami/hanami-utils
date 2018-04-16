# frozen_string_literal: true

require "rubygems"
require "bundler"
Bundler.setup(:default, :development)

$LOAD_PATH.unshift "lib"
require "hanami/utils"
require_relative "./rspec"

module RSpec
  module Support
    module Runner
      def self.run
        Core::Runner.autorun
      end
    end
  end
end
