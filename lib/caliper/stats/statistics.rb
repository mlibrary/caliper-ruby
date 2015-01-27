module Caliper
	module Stats
		class Statistics < StatisticsMap
			MEASURE_KEY = "Measure"
			DESCRIBE_KEY = "Describe"
			SUCCESSFUL_KEY = "Successful"
			FAILED_KEY = "Failed"

			# Returns the statistic representing how many describe calls happened
			def get_describes
				return ensure(DESCRIBE_KEY)
			end

			def update_describes(val)
				update(DESCRIBE_KEY, val)
			end

			def get_measures
				return ensure(MEASURE_KEY)
			end

			def update_measures(val)
				update(MEASURE_KEY, val)
			end

			def get_successful
				return ensure(SUCCESSFUL_KEY)
			end

			def update_successful
				update(SUCCESSFUL_KEY, val)
			end

			def get_failed
				return ensure(FAILED_KEY)
			end

			def update_failed
				update(FAILED_KEY, val)
			end


		end
	end
end