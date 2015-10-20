IMS Global caliper-ruby
===================

caliper-ruby is a Ruby client for [Caliper](http://www.imsglobal.org/caliper) that provides an implementation of the Caliper SensorAPI™.

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

## Documentation

Documentation is available at [http://www.imsglobal.org/caliper](https://www.imsglobal.org/caliper).

©2015 IMS Global Learning Consortium, Inc. All Rights Reserved.
Trademark Information - http://www.imsglobal.org/copyright.html

For license information contact, info@imsglobal.org and read the license file contained in the repository.