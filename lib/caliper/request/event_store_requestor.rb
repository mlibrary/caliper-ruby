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

require 'securerandom'
require_relative './event_store_envelope'

#
# Event store requestor.
#
module Caliper
  module Request
    class EventStoreRequestor

      def get_payload_json(caliper_event, id, send_time)

        list_payload = Array.new

        # new event envelope
        envelope = EventStoreEnvelope.new
        envelope.id = id
        envelope.type = "caliperEvent"
        envelope.time = send_time.to_s
        envelope.data = caliper_event

        # add envelope into array
        list_payload<< envelope

        json_payload = JSON.generate(list_payload)
        return json_payload
      end

      def generate_payload(caliper_event, id, send_time)
        if (id.nil?)
          id = "caliper-java_" + SecureRandom.uuid
        end

        if (send_time.nil?)
          send_time = Time.now
        end

        json_payload = get_payload_json(caliper_event, id, send_time)

      end
    end
  end
end
