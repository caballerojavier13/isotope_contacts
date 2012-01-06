## Developing on IsotopeCRM
IsotopeCRM is implemented as a Rails engine and its tests are run in the context
of a dummy Rails app. The process for getting the tests to run is similar to setting up a regular rails app:

    bundle exec rake -f test/dummy/Rakefile db:drop db:create db:migrate db:test:prepare

Once this setup has been done, IsotopeCRM's specs can be run by executing this command:

    bundle exec rake test
