# frozen_string_literal: true

source "https://rubygems.org"

eval_gemfile "Gemfile.devtools"

gemspec

unless ENV["CI"]
  gem "byebug", platforms: :mri
  gem "yard"
  gem "yard-junk"
end

group :multi_json do
  gem "multi_json", "~> 1.0", require: false
end

gem "gson", ">= 0.6", platforms: :jruby

group :test do
  gem "rspec", "~> 3.9"
end
