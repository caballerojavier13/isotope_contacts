require "minitest/autorun"
require "minitest/rails"
#require "turn"
require 'database_cleaner'
require 'factory_girl'
require 'ruby-debug'

ENV["RAILS_ENV"] = "test"
require File.expand_path("../dummy/config/environment.rb", __FILE__)

require 'capybara/rails'
require 'capybara_minitest_spec'

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

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
