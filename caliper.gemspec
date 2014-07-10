$:.push File.expand_path("../lib", __FILE__)

require 'caliper/version'

Gem::Specification.new do |g|
  g.name        = "caliper"
  g.version     = Caliper::VERSION
  g.authors     = ["Anthus Williams"]
  g.email       = ["analytics@imsglobal.com"]
  g.homepage    = "http://www.imsglobal.com"
  g.summary     = "Caliper Sensor API"

  g.files = Dir["{app,config,db,lib}/**/*", "Rakefile"]

  g.add_development_dependency "rspec"
  g.add_development_dependency "simplecov"
  g.add_development_dependency "simplecov-rcov"
  g.add_development_dependency "mocha"
end
