require 'rest_client'
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

    def initialize(options)
      @options = options
      puts "Sensor - initializing with options = #{@options}"
    end

    def send(event)
      raise ArgumentError, "Expecting Caliper::Event but got #{event.class.to_s}" unless event.is_a?(Caliper::Event::Event)

      RestClient.post @options['host'], event.to_json, :content_type => :json, :accept => :json

    end

    def describe(entity)
      raise ArgumentError, "Expecting Caliper::Entity but got #{entity.class.to_s}" unless entity.is_a?(Caliper::Entity::Base)

      RestClient.post @options['host'], entity.to_json, :content_type => :json, :accept => :json

    end

  end
end
