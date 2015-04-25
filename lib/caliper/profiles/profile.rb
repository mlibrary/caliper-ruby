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

require 'i18n'

#
# Base Profile.
#
module Caliper
  module Profiles
    module ProfileActions
      NAVIGATED_TO = "http://purl.imsglobal.org/vocab/caliper/v1/action#NavigatedTo"
    end

    module ProfileConformance
      ACTION_IS_NULL = "an action must be specified."
      ACTION_UNRECOGNIZED = "unrecognized action."
      ACTOR_NOT_PERSON = "actor must be of type Person"
      ACTOR_NOT_SOFTWAREAPP = "actor must be of type SoftwareApplication"
      CONTEXT_ERROR = "context URI must be specified"
      DURATION_INVALID = "duration format is invalid"
      ENDEDATTIME_SET = "endedAtTime must not be specified"
      EVENT_ILLEGAL_STATE = "event constructed in an illegal state."
      GENERATED_NOT_NULL = "a generated object is not required."
      GENERATED_NOT_SESSION = "generated object must be of type Session"
      OBJECT_NOT_SOFTWAREAPP = "object must be of type SoftwareApplication"
      STARTEDATTIME_IS_NULL = "startedAtTime must be specified."
      TARGET_NOT_DIGITALRESOURCE = "target must be of type DigitalResource"
      TARGET_NOT_SESSION = "target must be of type Session"
      TIME_ERROR = "end time must be greater than start time."
      TYPE_ERROR = "type URI must be specified"
    end

    class Profile
      include ProfileActions

      def initialize()
      end

      def get_navigated_to_action_from_bundle(key)
        if key.equal? ProfileActions::NAVIGATED_TO
          return I18n.translate :action
        end
      end
    end
  end
end
