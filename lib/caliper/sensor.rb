require_relative "client"

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

		# Describe a Entity that is part of the learning graph
		def describe(entity)
			is_initialized()
			@default_client.describe(entity)
		end

		def send(event)
			is_initialized()
			@default_client.describe(event)
		end

		def get_statistics()
			is_initialized()
			@default_client.getStatistics()
		end
	end
end