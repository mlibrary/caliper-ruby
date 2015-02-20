module Caliper
	module Validators
		class EventValidatorContext
			attr_accessor :validator

			def initialize(validator)
				@validator = validator
			end

			def validate (event)
				# do the validation
				return @validator.validate(event)
			end
		end
	end
end
