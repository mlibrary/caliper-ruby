require_relative '../../entities/foaf/agent'

module Caliper
	module Entities
		module Lis
			class Organization < Caliper::Entities::FOAF::Agent
				attr_accessor :type, # String
											:parent_org # Organization
			end
		end
	end
end