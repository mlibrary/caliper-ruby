require_relative '../digital_resource'
require_relative '../digital_resource_type'
require_relative '../targetable'

module Caliper
	module Entities
		module Reading
			class Frame < DigitalResource
				include Targetable
				include Caliper::Entities::DigitalResourceType

				attr_accessor :id,
			                :type,
			                :name,
			                :object_type,
			                :aligned_learning_object,
			                :keyword,
			                :part_of,
			                :last_modified_time,
			                :index

				def initialize
					super
					@type = DigitalResourceType::FRAME
				end

			end
		end
	end
end