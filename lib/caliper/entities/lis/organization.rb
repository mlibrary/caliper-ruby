require_relative '../../entities/foaf/agent'
require_relative '../../entities/entity'

module Caliper
	module Entities
		module LIS
			class Organization < Caliper::Entities::FOAF::Agent
				attr_accessor :type, # String
											:parent_org # Organization

				def initialize
					super
					@type = Caliper::Entities::EntityType::LIS_ORGANIZATION
				end
			end
		end
	end
end