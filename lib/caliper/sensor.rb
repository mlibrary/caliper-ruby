require_relative "client"
require_relative "options"

## create
module Caliper
	class Sensor
		attr_accessor :default_client

		# options to configure the behavior of Caliper client
		def initialize(options)
			@default_client=Client.new(options)
		end

		# Client initialization check
		def is_initialized()
			if default_client.nil?
				# fail with RuntimeError
				fail 'Caliper client is not initialized. Please call Caliper.initialize(..); before calling measure or describe'
			end
		end

		# Describe a Caliper Entity
		def describe(entity)
			is_initialized()
			@default_client.describe(entity)
		end

		# Send Caliper Event
		def send(event)
			is_initialized()
			@default_client.measure(event)
		end

		def get_statistics()
			is_initialized()
			@default_client.getStatistics()
		end
	end
end