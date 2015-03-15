require_relative '../../entities/entity'
#
#  @author Prashant Nayak
#  @copyright @copyright ©2013 IMS Global Learning Consortium, Inc.  All Rights Reserved.
#  @license For license information contact, info@imsglobal.org
#
module Caliper
  module Entities
    module LIS
      # Represents Person.
      # @extends Agent
      class Person < Entity
        include Caliper::Entities::FOAF::Agent

        def initialize
          super
          @type = EntityType::LIS_PERSON
        end

        def to_json
          {'@id' => @id,
           '@type' => @type,
           'name' => @name,
           'description' => @description,
           'properties' => @properties,
           'dateCreated' => @date_created,
           'dateModified' => @date_modified,
           '@class' => self.class.name,
           }.to_json
        end

        def self.from_json json_hash
          data = json_hash
          puts "Person from_json: json_hash = #{json_hash}"
          retObj = self.new
          retObj.id = data['@id']
          retObj.type = data['@type']
          retObj.name = data['name']
          retObj.description = data['description']
          retObj.properties = data['properties']
          retObj.date_created = data['dateCreated']
          retObj.date_modified = data['dateModified']
          return retObj
        end

        def eql?(other)
          puts "#eql? invoked"
          @id == other.id && @type == other.type
          # && @name == other.name && @description == other.description
          # && @date_created == other.date_created && @date_modified == other.date_modified
        end
      end
    end
  end
end
