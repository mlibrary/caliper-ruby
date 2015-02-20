require_relative '../../entities/entity'

module Caliper
	module Entities
		module LIS
			class Person < Entity
				include Caliper::Entities::FOAF::Agent
				attr_accessor :type # String
			end
		end
	end
end