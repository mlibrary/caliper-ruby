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

require_relative 'event_store_requestor'
require_relative 'event_store_envelope'
require "net/http"
require "uri"

module Caliper
	module Request
		class HttpRequestor < Caliper::Request::EventStoreRequestor

			attr_accessor :options

			def initialize(options)
				@options = options
			end

			def send(event)
				status = false

				# the option.host returns whole url string
				uri = URI(@options.host)
				Net::HTTP.start(uri.host, uri.port) do |http|
					request = Net::HTTP::Post.new uri

					response = http.request request # Net::HTTPResponse object
				end

				if (response.code != 200)
					status_code = response.code

					# failed call
					status = false
					fail "Failed: HTTP error code: " + status_code
				else
					# success call
					status = true
				end

				return status
			end
		end
	end
end
