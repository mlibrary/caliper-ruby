require_relative '../entity'
require_relative '../generatable'
module Caliper
	module Entities
		class Result < Entity
			include Generatable

			attr_accessor :type, # String
										:normalScore,
										:penaltyScore,
										:extraCreditScore,
										:totalScore,
										:curvedTotalScore,
										:curveFactor,
										:comment,
										:scoredBy
		end

		def initialize

		end
	end
end
