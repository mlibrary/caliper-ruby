caliper-ruby
===================

caliper-ruby is a Ruby client for [Caliper](http://www.imsglobal.org) that provides a Ruby implementation of the Caliper Sensor API

## development notes
To set up dev environment and run specs
* git clone <this repo>
* ensure you have ruby, bundler, rspec installed 
* bundle install
* rspec spec # runs all specs

#### _Note_
To run specs, you need to clone caliper-common-fixtures at the same level as caliper-ruby.  Then please create a symlink similar to

➜  caliper-ruby git:(master)  ln -s ../../caliper-common-fixtures/src/test/resources/fixtures ./spec/fixtures

## generate the Ruby Gem

gem build caliper.gemspec

### Use Ruby Style Guide:
https://github.com/styleguide/ruby
https://github.com/bbatsov/ruby-style-guide
