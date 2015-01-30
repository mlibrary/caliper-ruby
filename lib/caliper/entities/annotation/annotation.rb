require_relative '../../entities/entity'
require_relative '../../entities/schemadotorg/thing'

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
				attr_accessor :target,
			                :type

				def initialize
					super
					type = AnnotationType::ANNOTATION
					target = ''
				end
			end
		end
	end
end
