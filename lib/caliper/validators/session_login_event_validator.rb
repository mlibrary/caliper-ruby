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

require_relative 'event_validator'
require_relative 'error_message'
require_relative 'property_type_check'
require_relative 'time_check'
require_relative '../event/event'
require_relative '../profiles/profile'
require_relative '../entities/lis/person'
require_relative '../entities/digital_resource'
require_relative '../entities/session'
require_relative '../entities/schemadotorg/software_application'

#
# Session Login validator
#
module Caliper
	module Validators
		class SessionLoginEventValidator
			include EventValidator
			include TimeCheck

			## Validate session login event properties.
	    # Properties
	    # context:: required
	    # type:: required
	    # edApp:: optional
	    # group:: optional
	    # actor:: required: Person
	    # action:: required: session.loggedIn
	    # object:: required: SoftwareApplication
	    # target:: required: DigitalResource
	    # generated:: required: Session
	    # startedAtTime:: required
	    # endedAtTime:: optional: but should not be set.
	    # duration:: optional: but should not be set.
			# returns conformance violations message.
			def validate(event)
				context = "session"
				error_message = ErrorMessage.new
				property_check = PropertyTypeCheck.new


				if (!event.is_a?(Event))
					# check whether the argument is of right type
					return
				else
					# is event context of Session
					if (!event.context.equal?(EventType::SESSION))
						error_message.append_text(event.context + " " + ProfileConformance::CONTEXT_ERROR)
					end

					# is event type of Session
					if (!event.type.equal?(EventType::SESSION))
						error_message.append_text(event.type + " " + ProfileConformance::TYPE_ERROR)
					end

					# is event actor a Person
					if (!property_check.is_object_of_type(event.actor, Person.class))
						error_message.append_text(event.actor.class + " " + ProfileConformance::ACTOR_NOT_PERSON)
					end

					# is event object a SoftwareApplication
					if (!property_check.is_object_of_type(event.object, SoftwareApplication.class))
						error_message.append_text(event.object.class + " " + ProfileConformance::OBJECT_NOT_SOFTWAREAPP)
					end

					# is event target a DigitalResource
					if (!property_check.is_object_of_type(event.target, DigitalResource.class))
						error_message.append_text(event.object.class + " " + ProfileConformance::TARGET_NOT_DIGITALRESOURCE)
					end

					if (property_check.is_object_of_type(event.generated, Session.class))
						if (event.generated.started_at_time == 0)
							error_message.append_text(context + " " + ProfileConformance::STARTEDATTIME_IS_NULL)
						elsif (event.generated.end_at_time != 0)
							error_message.append_text(context + " " + ProfileConformance::ENDEDATTIME_SET)
						end
					else
						error_message.append_text(ProfileConformance::GENERATED_NOT_SESSION)
					end

					# start time set for event
					if (!check_started_at_time(event.started_at_time))
						error_message.append_text(ProfileConformance::STARTEDATTIME_IS_NULL)
					end

					# also check the event end time
					if (!check_ended_at_time(event.started_at_time, event.ended_at_time))
						error_message.append_text(ProfileConformance::TIME_ERROR)
					end

					# check duration value
					if (check_duration(event.duration))
						error_message.append_text(ProfileConformance::DURATION_INVALID)
					end

					if (error_message.length() > 0)
						error_message.end_message("Caliper Session profile login event conformance: ")
					end

					return error_message.text
				end
			end
		end
	end
end