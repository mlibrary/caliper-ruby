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
# Event Validator.
#
module Caliper
	module Validators
		module EventValidator
			module Conformance
				ACTION_IS_NULL = "an action must be specified."
				ACTION_UNRECOGNIZED = "unrecognized action."
				ACTOR_NOT_PERSON = "actor must be of type Person"
				ACTOR_NOT_SOFTWAREAPP = "actor must be of type SoftwareApplication"
				ASSIGNABLE_NOT_ASSESSMENT = "assignable must be of type Assessment"
				CONTEXT_ERROR = "context URI must be specified"
				COUNT_NOT_ZERO = "count must be specified"
				DURATION_INVALID = "duration format is invalid"
				ENDEDATTIME_IS_NULL = "endedAtTime must be specified"
				ENDEDATTIME_SET = "endedAtTime must not be specified"
				EVENT_ILLEGAL_STATE = "event constructed in an illegal state."
				GENERATED_NOT_ATTEMPT = "generated object must be of type Attempt"
				GENERATED_NOT_NULL = "a generated object is not required"
				GENERATED_NOT_SESSION = "generated object must be of type Session"
				OBJECT_NOT_ASSESSMENT = "object must be of type Assessment"
				OBJECT_NOT_SOFTWAREAPP = "object must be of type SoftwareApplication"
				STARTEDATTIME_IS_NULL = "startedAtTime must be specified"
				TARGET_NOT_CREATIVEWORK = "target must be of type CreativeWork"
				TARGET_NOT_DIGITALRESOURCE = "target must be of type DigitalResource"
				TARGET_NOT_NULL = "target is not required."
				TARGET_NOT_SESSION = "target must be of type Session"
				TARGET_NOT_SET = "target must be specified"
				TARGET_NOT_THING = "target must be of type Thing"
				TIME_ERROR = "end time must be greater than start time."
				TYPE_ERROR = "type URI must be specified"
			end

			def validate
				# to be implemented
			end
		end
	end
end