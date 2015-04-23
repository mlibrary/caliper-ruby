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

#
# Time check.
#
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