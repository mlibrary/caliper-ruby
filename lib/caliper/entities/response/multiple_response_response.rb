
#
# Representation of a response to a multiple choice question that permits one or more options to be selected.
#

module Caliper
	module Entities
		module Response
			class MultipleResponseResponse < Response
				attr_accessor :type,
			                :values

				def initialize
					@type = ResponseType::MULTIPLERESPONSE
				end
			end
		end
	end
end