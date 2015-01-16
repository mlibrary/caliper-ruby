require_relative "digital_resource"
require_relative "../../../lib/caliper/entities/schemadotorg/web_page"
module Caliper
	module Entities
		class WebPage < DigitalResource
			## include WebPage  TODO: not include the WebPage module for now

			attr_accessor :type
			def initialize(type)
				super.initialize
				@type = type
			end
		end
	end
end