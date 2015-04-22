require "require_all"
require_all 'lib/caliper/entities/generatable.rb'

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