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
