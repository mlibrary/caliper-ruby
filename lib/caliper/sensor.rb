require_relative "client"
require_relative "options"

##
#  
#  @copyright @copyright ©2013 IMS Global Learning Consortium, Inc.  All Rights Reserved.
#  @license For license information contact, info@imsglobal.org
#
# Caliper Sensor
#
#
module Caliper

  class Sensor

    attr_accessor :default_client

    # options to configure the behavior of Caliper client
    def initialize(options)
      @default_client = Client.new(options)
    end

    # Client initialization check
    def is_initialized()
      if default_client.nil?
        # fail with RuntimeError
        fail 'Caliper client is not initialized. Please call Caliper.initialize(..); before calling send or describe'
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
      @default_client.send(event)
    end

    def get_statistics()
      is_initialized()
      @default_client.getStatistics()
    end

  end
end
