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

require 'rest-client'
require_relative './envelope'
require_relative './event_store_requestor'

#
# HTTP requestor.
#
module Caliper
  module Request
    class HttpRequestor < Caliper::Request::EventStoreRequestor

      attr_accessor :options

      ##
      # Create a new HttpRequestor
      #
      # @param options [Hash] expects 'host' and 'auth_token' keys/values
      #                       'host' - The URL to send the JSON to
      #                       'auth_token' - The value for the Authorization header's bearer token
      #
      # @return [String] the object converted into the expected format.
      def initialize(options)
        @options = options
      end

      # Send the Caliper request via POST to a service endpoint
      #
      # @param sensor [Caliper::Sensor]
      # @param data [Hash]
      def send(sensor, data)
        payload = generate_payload(sensor, data)

        # What about the api key (authorization)?
        RestClient.post @options['host'], payload, :content_type => :json, :accept => :json, :authorization => "Bearer #{options['auth_token']}"
      end
    end
  end
end
