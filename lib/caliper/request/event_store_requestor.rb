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
require_relative './envelope'

#
# Event store requestor.
#
module Caliper
  module Request
    class EventStoreRequestor

      def generate_payload(sensor, data)
        return get_payload_json(sensor, data)
      end

      def get_payload_json(sensor, data)
        envelope = create_envelope(sensor, data)
        return JSON.generate(envelope)
      end

      def create_envelope(sensor, data)
        envelope = Caliper::Request::Envelope.new
        envelope.sensor = sensor.id
        envelope.data = to_array(data)
        return envelope
      end

      def to_array(data)
        return [data] if !(data.is_a?(Array))
      end
    end
  end
end
