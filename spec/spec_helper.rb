# frozen_string_literal: true

require "hanami/utils"
require "pathname"

SPEC_ROOT = Pathname(__FILE__).dirname

require_relative "support/rspec"
SPEC_ROOT.glob("support/**/*.rb").each { |f| require(f) }
