module Caliper
	module Entities
		module LIS
			class Person < Caliper::Entities::FOAF::Agent
				attr_accessor :type # String
			end
		end
	end
end