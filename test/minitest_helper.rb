require "minitest/autorun"
require "minitest/rails"
require 'database_cleaner'

ENV["RAILS_ENV"] = "test"
require File.expand_path("../dummy/config/environment.rb", __FILE__)

require 'capybara/rails'

# If description name ends with 'integration', use this RequestSpec class.
# It has all the integration test goodies.
class RequestSpec < MiniTest::Spec
  include Rails.application.routes.url_helpers
  include Capybara::DSL
end

MiniTest::Spec.register_spec_type /integration$/i, RequestSpec

# Database cleaner.
DatabaseCleaner.strategy = :truncation
class MiniTest::Spec
  before :each do
    DatabaseCleaner.clean
  end
end

class MiniTest::Rails::Spec
  # Add methods to be used by all specs here...
end
