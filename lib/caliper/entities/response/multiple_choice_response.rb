require "require_all"
require_all 'lib/caliper/entities/response/response_type.rb'
#
# Represents a response to a multiple choice question that permits a single option to be selected
#

module Caliper
	module Entities
		module Response
			class MultipleChoiceResponse < Response
				attr_accessor :type,
			                :values

				def initialize
					@type = ResponseType::MULTIPLECHOICE
				end
			end
		end
	end
end