require "require_all"
require_all 'lib/caliper/entities/response/response_type.rb'
#
# Represents response to a multiple choice question that limits options to either 'true or false',
# 'agree or disagree', etc.
#

module Caliper
	module Entities
		module Response
			class TrueFalseResponse < Response
				attr_accessor :type,
			                :values

				def initialize
					@type = ResponseType::TRUEFALSE
				end
			end
		end
	end
end