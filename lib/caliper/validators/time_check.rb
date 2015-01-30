module Caliper
	module Validators
		module TimeCheck

			# validate startedAtTime
			def check_started_at_time(started_at_time)
				return started_at_time > 0
			end

			# Event ended_at_time is an optional setting.
			# If both a started_at_time and ended_at_aime are specified
			# check that startedAtTime precedes endedAtTime.  If not return false.
			def check_ended_at_time(started_at_time, ended_at_time)
				if (check_started_at_time(started_at_time))
					return ended_at_time >= started_at_time
				else
					return true
				end
			end

			def check_duration(duration)
				if (!duration.nil? && !duration.length == 0)
					return true
				else
					return false
				end
			end
		end
	end
end