require "json"
require_relative 'digital_resource_type'
require_relative 'entity'
require_relative 'entity_type'

# Public: Caliper representation of a CreativeWork (https://schema.org/CreativeWork)
# We add learning specific attributes, including a list of
# LearningObjective learning objectives and a list of
# String keywords
#
# Examples
#

module Caliper
  module Entities
    class DigitalResource < Entity
	    attr_accessor :id,
                    :name,  #(https://schema.org/name) -the name of the resource,
                    :object_type,
                    :properties,
                    :aligned_learning_objectives, # a list of learning objectives
	                  :keywords,  # a list of learning objectives
	                  :part_of,
	                  :last_modified_time,
	                  :about, # (https://schema.org/about) - the subject matter of the resource
	                  :language #(https://schema.org/Language) - Natural languages such as Spanish, Tamil, Hindi, English, etc.
	                            # and programming languages such as Scheme and Lisp.
										:type

	    # Public:
      def to_json(*a)
	      {
		      "id" => @id,
		      "type" => @type,
		      "name" => @name,
		      "objectType" => @object_type,
		      "properties" =>@properties,
	        "alignedLearningObjective" => @aligned_learning_objective,
	        "keyword" => @keyword,
	        "partOf" => @part_of,
	        "lastModifiedTime" => @last_modified_time
	      }.to_json(*a)
      end

	    def initialize()
		    super
		    @id=""
			  @name = ""
			  @objectType = "object type"
		    @properties = ""
			  @alignedLearningObjective = ""
			  @keyword = ""
			  @partOf = ""
			  @lastModifiedTime = ""
		    @type = Caliper::Entities::EntityType::DIGITAL_RESOURCE
	    end

	    def DigitalResource.type
		    return @type
	    end
    end
  end
end
