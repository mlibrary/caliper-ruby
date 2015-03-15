require 'json'
require_relative './jsonable'

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
      include Caliper::Entities::Jsonable

      attr_accessor :id,
        :type,
        :name,
        :description,
        :properties,
        :date_created,
        :date_modified

      def initialize()
        @id = ""
        @type = EntityType::ENTITY
        @name = ""
        @description = ""
        @properties = ""
        @date_created = Time.now.utc
        @date_modified = Time.now.utc
      end

      # def to_json
      #   {'@id' => @id,
      #    '@type' => @type,
      #    'name' => @name,
      #    'description' => @description,
      #    'properties' => @properties,
      #    'dateCreated' => @date_created,
      #    'dateModified' => @date_modified,
      #    '@class' => self.class.name,
      #    }.to_json
      # end

      # def self.from_json json_hash
      #   data = json_hash
      #   puts "Entity.from_json: json_hash = #{json_hash}"
      #   retObj = self.new
      #   retObj.id = data['@id']
      #   retObj.type = data['@type']
      #   retObj.description = data['description']
      #   retObj.properties = data['properties']
      #   retObj.date_created = data['dateCreated']
      #   retObj.date_modified = data['dateModified']
      #   return retObj
      # end

      # def eql?(other)
      #   puts "#eql? invoked"
      #   @id == other.id && @type == other.type 
      #   # && @name == other.name && @description == other.description 
      #   # && @date_created == other.date_created && @date_modified == other.date_modified
      # end
    end
  end
end
