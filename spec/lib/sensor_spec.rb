require 'require_all'
require_all 'lib/caliper/sensor.rb'
require_relative './event_helper'

module Caliper

  describe Sensor do
  	include Helper

    it "should ensure that we can create and send an event" do

      options = {
        'host'  => 'http://requestb.in/1i7pr2i1',
        'sensorId' => 'test_sensor_id',
        'apiKey' => 'test_api_key'
      }

      sensor = Sensor.new options
      event  = session_event
      
      # NOTE: To test sending events to an actual endpoint, 
      # for now, uncomment the line below after setting options.host above
      # to a new/valid request bin or end point URL.
      
      # sensor.send event

    end

  end
end
