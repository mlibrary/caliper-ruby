require "json"

##
##  The base Caliper Entity.  Analogous to a schema.org Thing.
##
module Caliper
  module Entities
	  module EntityType
		  AGENT = "http://purl.imsglobal.org/caliper/v1/Agent"
		  ATTEMPT = "http://purl.imsglobal.org/caliper/v1/Attempt"
		  DIGITAL_RESOURCE = "http://purl.imsglobal.org/caliper/v1/DigitalResource"
		  ENTITY = "http://purl.imsglobal.org/caliper/v1/Entity"
		  GENERATED = "http://purl.imsglobal.org/caliper/v1/Generated"
		  LEARNING_OBJECTIVE = "http://purl.imsglobal.org/caliper/v1/LearningObjective"
		  LIS_PERSON = "http://purl.imsglobal.org/caliper/v1/lis/Person"
		  LIS_ORGANIZATION = "http://purl.imsglobal.org/caliper/v1/lis/Organization"
		  RESULT = "http://purl.imsglobal.org/caliper/v1/Result"
		  SESSION = "http://purl.imsglobal.org/caliper/v1/Session"
		  SOFTWARE_APPLICATION = "http://purl.imsglobal.org/caliper/v1/SoftwareApplication"
		  TARGET = "http://purl.imsglobal.org/caliper/v1/Target"
		  VIEW = "http://purl.imsglobal.org/caliper/v1/View"
	  end

    class Entity
			attr_accessor :id,
			              :type,
			              :name,
			              :last_modified

			def initialize()
				@id = ""
				@type = EntityType::ENTITY
				@name = ""
				@last_modified = ""
			end
    end
  end
end
