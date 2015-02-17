require "json"
require_relative 'entity'

# Public: Caliper representation of a CreativeWork (https://schema.org/CreativeWork)
# We add learning specific attributes, including a list of
# LearningObjective learning objectives and a list of
# String keywords
#
# Examples
#

module Caliper
  module Entities
	  module DigitalResourceType
		  ASSIGNABLE_DIGITAL_RESOURCE = "http://purl.imsglobal.org/caliper/v1/AssignableDigitalResource"
		  EPUB_CHAPTER = "http://www.idpf.org/epub/vocab/structure/#chapter"
		  EPUB_PART = "http://www.idpf.org/epub/vocab/structure/#part"
		  EPUB_SUB_CHAPTER = "http://www.idpf.org/epub/vocab/structure/#subchapter"
		  EPUB_VOLUME = "http://www.idpf.org/epub/vocab/structure/#volume"
		  FRAME = "http://purl.imsglobal.org/caliper/v1/Frame"
		  MEDIA_LOCATION = "http://purl.imsglobal.org/caliper/v1/MediaLocation"
		  MEDIA_OBJECT = "http://purl.imsglobal.org/caliper/v1/MediaObject"
		  READING = "http://www.idpf.org/epub/vocab/structure"
		  WEB_PAGE = "http://purl.imsglobal.org/caliper/v1/WebPage"
	  end
    class DigitalResource < Entity
	    attr_accessor :type,
	                  :object_types, # list of String
	                  :learning_objectives, # a list of learning objectives
	                  :keywords,
	                  :is_part_of,
	                  :date_published

	    # Public:
      def to_json(*a)
	      {
		      "type" => @type,
		      "objectTypes" => @object_types,
	        "learningObjective" => @learning_objectives,
	        "keywords" => @keywords,
	        "isPartOf" => @is_part_of,
	        "datePublished" => @date_published
	      }.to_json(*a)
      end

	    def initialize()
		    super
		    @type = EntityType::DIGITAL_RESOURCE
	    end
    end
  end
end
