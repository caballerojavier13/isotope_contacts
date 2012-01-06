$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "isotope_contacts/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "isotope_contacts"
  s.version     = IsotopeContacts::VERSION
  s.authors     = ["Josh Adams"]
  s.email       = ["josh@isotope11.com"]
  s.homepage    = "http://www.isotope11.com"
  s.summary     = "A Rails 3 engine for contact management."
  s.description = "A Rails 3 engine for contact management."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.1.3"
  s.add_dependency 'bootstrap-sass'
  s.add_dependency 'formtastic-bootstrap'
  s.add_dependency 'haml'
  s.add_dependency 'meta_search'
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "minitest-rails"
  s.add_development_dependency "factory_girl"
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'capybara_minitest_spec'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'ruby-debug19'
  #s.add_development_dependency 'turn'
end
