require "require_all"
require_all 'lib/caliper/entities/response/response_type.rb'
#
# Represents response text or integer/decimal/scientific numbers that completes a question
# designed with one or more "fill in the blank" option prompts.

module Caliper
	module Entities
		module Response
			class FillinBlankResponse < Response
				attr_accessor :type,
			                :values

				def initialize
					@type = ResponseType::FILLINBLANK
				end
			end
		end
	end
end