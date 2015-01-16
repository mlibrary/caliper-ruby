require 'atomic'

module Caliper
	module Stats
		class Statistic

			attr_accessor :sum, :count, :last

			def initialize
				@sum = Atomic.new(0)
				@count = Atomic.new(0)
				@last = Atomic.new(0)
				@lock = Atomic.new(false)
			end

			# add another value to this statistic
			def update(val)
				n = 
			end
		end
	end
end
