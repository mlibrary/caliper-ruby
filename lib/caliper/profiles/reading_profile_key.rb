
require 'caliper/profiles/profile'
require 'caliper/entities/digital_resource'
require 'caliper/entities/reading/frame'

module Caliper
	module Profiles
		class ReadingProfile
			SEARCHED = "reading.searched"
			VIEWED = "reading.viewed"

			attr_accessor :key, # String
										:lookup # hash of ReadingActions
		end
		class ReadingProfile < Profile

			# whether object if of type DigitalResource
			def validate_object(object)
				if (object.is_a? DigitalResource)
					return object
				else
					fail "Object must e of type DigitalResource"
				end
			end

			# whether target is of type Frame
			def validate_target(target)
				if (target is_a? frame)
					return target
				else
					fail "Target must be of type Frame."
				end
			end
		end
	end
end