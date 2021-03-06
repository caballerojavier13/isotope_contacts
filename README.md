## IsotopeContacts
IsotopeContacts is a gem providing a rails engine for contact management.

It is compatible with Rails 3.1+

### Demo site
[See it in action here.](http://isotope-contacts-demo.heroku.com)

### Screenshots
Here are some screenshots of what it looks like:

![Contact Listing](https://raw.github.com/isotope11/isotope_contacts/master/doc/contacts_listing.png)


![Contact Show](https://raw.github.com/isotope11/isotope_contacts/master/doc/contact_show.png)

### Installation
You can install it by adding the following to your Gemfile:

    gem 'isotope_contacts', :git => 'http://github.com/isotope11/isotope_contacts.git'

Then in your config/routes.rb:

    mount IsotopeContacts::Engine => "/isotope_contacts"

Then just fire up your app and visit `/isotope_contacts`

### Developing on IsotopeContacts
IsotopeContacts is implemented as a Rails engine and its tests are run in the context
of a dummy Rails app. The process for getting the tests to run is similar to setting up a regular rails app:

    bundle exec rake -f test/dummy/Rakefile db:drop db:create db:migrate db:test:prepare

Once this setup has been done, IsotopeContacts's specs can be run by executing this command:

    bundle exec rake test
