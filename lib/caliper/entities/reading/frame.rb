require_relative '../digital_resource'
require_relative '../targetable'

module Caliper
	module Entities
		module Reading
			class Frame < DigitalResource
				include Targetable

				attr_accessor :id,
			                :type,
			                :name,
			                :description,
			                :object_type,
			                :aligned_learning_objective,
			                :keywords,
			                :is_part_of,
			                :properties,
			                :date_created,
			                :date_modified,
			                :date_published,
			                :index

				def initialize
					super
					@type = DigitalResourceType::FRAME
				end

			end
		end
	end
end