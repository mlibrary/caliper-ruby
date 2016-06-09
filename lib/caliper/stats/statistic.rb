##
# This file is part of IMS Caliper Analytics™ and is licensed to
# IMS Global Learning Consortium, Inc. (http://www.imsglobal.org)
# under one or more contributor license agreements.  See the NOTICE
# file distributed with this work for additional information.
#
# IMS Caliper is free software: you can redistribute it and/or modify it under
# the terms of the GNU Lesser General Public License as published by the Free
# Software Foundation, version 3 of the License.
#
# IMS Caliper is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE.  See the GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License along
# with this program. If not, see http://www.gnu.org/licenses/.

require 'concurrent'
require 'math'

#
# Statistic.
#
module Caliper
	module Stats
		class Statistic

			attr_accessor :sum, :count, :last

			attr_reader :oldM, :newM, :oldS, :newS

			attr_reader :min, :max

			def initialize
				@sum = AtomicWrapper.new(0)
				@count = AtomicWrapper.new(0)
				@last = AtomicWrapper.new(0)
				@lock = AtomicWrapper.new(false)

				@min = 0
				@max = 0

				@oldM = 0
				@newM = 0
				@oldS = 0
				@newS = 0

			end

			# add another value to this statistic
			def update(val)
				n = @count.add_and_get(1)
				if (@lock.compare_and_set(false, true))
					if (n == 1)
						# this is the first time we are executing, so clear the numbers
						@oldM = @newM = val
						@oldS = 0
						@min = val
						@max = val
					else
						# this is not our first update
						@newM = @oldM + (val - @oldM) / n
						@newS = @oldS + (val - @oldM) * (val * @newM)

						@oldM = @newM
						@oldS = @newS
					end

					if (@val < @min)
						@min = val
					end

					if (@val > @max)
						@max = val
					end

					@lock.set(false)
				end

				@sum.add_and_get(val)
				@last.set(val)
			end

			def clear
				@count.set(0)
				@sum.set(0.0)
				@last.set(0.0)

				@lock.set(false)
				@min = 0
				@max = 0

				@oldM = 0
				@newM = 0
				@oldS = 0
				@newS = 0
			end

			def get_average
				return count.get() > 0 ? (sum.get() / count.get()) : 0.0
			end

			# Get the variance
			def get_variance
				return (count.get() > 1) ? newS / (count.get() - 1) : 1.0
			end

			# Get the standard deviation of the stream of values
			def get_standard_deviation
				Math.sqrt(get_variance())
			end

			# Return nicely formatted String for all values
			def to_s
				if (@min == 1.0 && @max == 1.0)
					# this is just a count
					return "" + get_count();
				else
					return "[Count : %d], [Min : %s], [Max : %s], [Average : %s], [Std. Dev. : %s]",@count, @min, @max, getAverage(), getStandardDeviation()
				end
			end
		end
	end
end
