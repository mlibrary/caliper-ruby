require_relative "../digital_resource"
require_relative "../digital_resource_type"

module Caliper
	module Entities
		module SchemaDotOrg
			class WebPage < Caliper::Entities::DigitalResource
				attr_accessor :type

				def initialize
					super
					@type = Caliper::Entities::DigitalResourceType::WEB_PAGE
				end
			end
		end
	end
end
