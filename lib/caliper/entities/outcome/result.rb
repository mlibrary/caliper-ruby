require_relative '../entity'
require_relative '../generatable'
module Caliper
	module Entities
		class Result < Entity
			include Generatable

			attr_accessor :type, # String
										:normal_score,
										:penalty_score,
										:extra_credit_score,
										:total_score,
										:curved_total_score,
										:curve_factor,
										:comment,
										:scored_by
		end

		def initialize

		end
	end
end
