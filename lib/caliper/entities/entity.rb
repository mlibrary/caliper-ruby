require "json"
require_relative 'base'

module Caliper
  module Entities
    class Agent < Caliper::Entities::Entity
	    include FOAF::Agent

			LIS_PERSON = "http://purl.imsglobal.org/caliper/v1/lis/Person"
			LIS_ORGANIZATION = "http://purl.imsglobal.org/caliper/v1/lis/Organization"
		  SOFTWARE_APPLICATION = "http://purl.imsglobal.org/caliper/v1/SoftwareApplication"

	    def initialize(type)
				@type=type
	    end
    end
  end
end
