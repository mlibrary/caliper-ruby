
#
# Represents a response that identifies text from a presented paragraph or list.
# The response is the identified string or a mapping to a logical identifier;

module Caliper
	module Entities
		module Response
			class SelectTextResponse < Response
				attr_accessor :type,
			                :values

				def initialize
					@type = ResponseType::SELECTTEXT
				end
			end
		end
	end
end