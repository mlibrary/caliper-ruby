require "json"
require_relative 'base'

# Public: Caliper representation of a CreativeWork (https://schema.org/CreativeWork)
# We add learning specific attributes, including a list of
# LearningObjective learning objectives and a list of
# String keywords
#
# Examples
#

module Caliper
  module Entities
    class DigitalResource < Base
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
			# type constant
	    TYPE ={:ASSIGNABLE_DIGITAL_RESOURCE=>"http://purl.imsglobal.org/caliper/v1/AssignableDigitalResource",
	           :EPUB_CHAPTER => "http://www.idpf.org/epub/vocab/structure/#chapter",
	           :EPUB_PART => "http://www.idpf.org/epub/vocab/structure/#part",
	           :EPUB_SUB_CHAPTER => "http://www.idpf.org/epub/vocab/structure/#subchapter",
	           :EPUB_VOLUME => "http://www.idpf.org/epub/vocab/structure/#volume",
	           :FRAME => "http://purl.imsglobal.org/caliper/v1/Frame",
	           :MEDIA_LOCATION => "http://purl.imsglobal.org/caliper/v1/MediaLocation",
	           :MEDIA_OBJECT => "http://purl.imsglobal.org/caliper/v1/MediaObject",
	           :READING => "http://www.idpf.org/epub/vocab/structure",
	           :WEB_PAGE => "http://purl.imsglobal.org/caliper/v1/WebPage"
	          }

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

	    def initialize(id)
				@id=id,
				@name = "",
				@objectType = "object type"
				@properties = "",
				@alignedLearningObjective = "",
				@keyword = "",
				@partOf = "",
				@lastModifiedTime = ""
	    end
    end
  end
end
