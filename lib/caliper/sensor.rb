require 'rest_client'
require_relative "options"
require_relative "event_envelope"
require_relative "entity_envelope"

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

    def initialize(options)
      @options = options
      puts "Sensor - initializing with options = #{@options}"
    end

    def send(event)
      raise ArgumentError, "Expecting Caliper::Event but got #{event.class.to_s}" unless event.is_a?(Caliper::Event::Event)

      envelope = EventEnvelope.new
      envelope.apiKey = @options['apiKey']
      envelope.sensorId = @options['sensorId']
      envelope.event = event

      RestClient.post @options['host'], envelope.to_json, :content_type => :json, :accept => :json

    end

    def describe(entity)
      raise ArgumentError, "Expecting Caliper::Entity but got #{entity.class.to_s}" unless entity.is_a?(Caliper::Entities::Entity)

      envelope = EntityEnvelope.new
      envelope.apiKey = @options['apiKey']
      envelope.sensorId = @options['sensorId']
      envelope.entity = entity

      RestClient.post @options['host'], envelope.to_json, :content_type => :json, :accept => :json

    end

  end
end
