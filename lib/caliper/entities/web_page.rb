require_relative "../entities/digital_resource"
require_relative "../entities/schemadotorg/web_page"
module Caliper
	module Entities
		class WebPage < DigitalResource
			include Caliper::Entities::SchemaDotOrg::WebPage
			def initialize()
				super
				@type = Caliper::Entities::DigitalResourceType::WEB_PAGE
			end
		end
	end
end