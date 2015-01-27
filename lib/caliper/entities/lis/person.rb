module Caliper
	module Entities
		module LIS
			class Person
				include Caliper::Entities::FOAF::Agent
				attr_accessor :type # String
			end
		end
	end
end