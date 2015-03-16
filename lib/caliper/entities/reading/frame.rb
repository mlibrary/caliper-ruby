require_relative '../../entities/digital_resource'
require_relative '../../entities/targetable'
require_relative '../../entities/jsonable'

module Caliper
	module Entities
		module Reading

			class Frame < DigitalResource
				include Targetable
				include Caliper::Entities::Jsonable

				attr_accessor :index

				def initialize
					super
					@type = DigitalResourceType::FRAME
					@index = 0
				end

			end
		end
	end
end