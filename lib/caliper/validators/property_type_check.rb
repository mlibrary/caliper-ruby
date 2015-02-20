
require_relative '../entities/lis/person'
require_relative '../entities/schemadotorg/software_application'
module Caliper
	module Validators
		class PropertyTypeCheck

			# whether the object is of wanted target class
			def is_object_of_type(object, targetClass)
				return !object.nil? && object.is_a?(targetClass)
			end
		end
	end
end
