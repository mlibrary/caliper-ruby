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

require_relative './envelope_jsonable'

#
# Event store envelope. Contains event info.
#
module Caliper
  module Request
    module Context
      CONTEXT = "http://purl.imsglobal.org/caliper/ctx/v1/Envelope"
    end

    # module Type
    #  TYPE = "http://purl.imsglobal.org/caliper/v1/Envelope"
    # end

    class Envelope
      include Caliper::Request::EnvelopeJsonable

      attr_accessor :context,
                    :sensor,
                    :sendTime,
                    :data

      def initialize
        @context = Context::CONTEXT
        @sensor = ''
        @sendTime = Time.now.utc.iso8601(3)
        @data = []
      end
    end
  end
end