require "require_all"

module Caliper
	module Entities
		module Response
			class Response < Entity
				include Generatable
				attr_accessor :type,
			                :assignable,
			                :actor,
			                :attempt,
			                :startedAtTime,
			                :endedAtTime,
			                :duration

				def initialize
					@type = EntityType::RESPONSE
				end
			end
		end
	end
end