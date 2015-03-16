$:.push File.expand_path("../lib", __FILE__)

require 'caliper/version'
Gem::Specification.new do |g|
	g.name        = "ims_caliper"
	g.version     = Caliper::VERSION
	g.authors     = ["Caliper Dev Group"]
	g.email       = ["lisa@imsglobal.org"]
	g.homepage    = "https://github.com/IMSGlobal/caliper-ruby"
	g.summary     = "Caliper Sensor API"
	g.description = "This is the implementation of IMSGlobal Caliper in Ruby"
	g.license     = "http://www.imsglobal.org/copyright.html"

	#g.files = Dir["{app,config,db,lib}/**/*", "Rakefile"]
	g.files     = `git ls-files`.split($\)
	g.executables   = g.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
	g.test_files    = g.files.grep(%r{^(test|spec|features)/})
	g.require_path = 'lib'

end
