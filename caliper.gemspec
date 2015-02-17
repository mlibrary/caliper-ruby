$:.push File.expand_path("../lib", __FILE__)

require 'caliper/version'
Gem::Specification.new do |g|
	g.name        = "ims_caliper"
	g.version     = Caliper::VERSION
	g.authors     = ["Anthus Williams", "Zhen Qian"]
	g.email       = ["aj@instructure.com", "zqian@umich.edu"]
	g.homepage    = "https://github.com/IMSGlobal/caliper-ruby"
	g.summary     = "Caliper Sensor API"
	g.description = "This is the implementation of IMSGlobal Caliper in Ruby"
	g.license     = "http://www.imsglobal.org/copyright.html"

	#g.files = Dir["{app,config,db,lib}/**/*", "Rakefile"]
	g.files        = Dir.glob("{lib}/**/*")
	#g.executables  = ['caliper']
	g.require_path = 'lib'

	#g.add_dependency "activesupport", '~> 0'
	#g.add_development_dependency "rspec", '~> 0'
	#g.add_development_dependency "simplecov", '~> 0'
	#g.add_development_dependency "simplecov-rcov", '~> 0'
	#g.add_development_dependency "mocha", '~> 0'
	#g.add_development_dependency 'atomic', '~> 1.1.99'
end
