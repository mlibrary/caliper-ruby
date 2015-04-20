require_relative '../../entities/entity'
require_relative '../../entities/schemadotorg/thing'

#
#  
#  @copyright @copyright ©2013 IMS Global Learning Consortium, Inc.  All Rights Reserved.
#  @license For license information contact, info@imsglobal.org
#
#
#  Annotation Entity
#
module Caliper
	module Entities
		module Annotation

			module AnnotationType
				ANNOTATION = "http://purl.imsglobal.org/caliper/v1/Annotation"
				BOOKMARK_ANNOTATION = "http://purl.imsglobal.org/caliper/v1/BookmarkAnnotation"
				HIGHLIGHT_ANNOTATION = "http://purl.imsglobal.org/caliper/v1/HighlightAnnotation"
				SHARED_ANNOTATION = "http://purl.imsglobal.org/caliper/v1/SharedAnnotation"
				TAG_ANNOTATION = "http://purl.imsglobal.org/caliper/v1/TagAnnotation"
			end

			## implement the interface Thing
			class Annotation < Entity
				include Caliper::Entities::SchemaDotOrg::Thing

				attr_accessor :annotated

				def initialize
					super
					@type = AnnotationType::ANNOTATION
					@annotated = nil
				end
			end

		end
	end
end
