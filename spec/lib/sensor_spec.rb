require 'require_all'
require_all 'lib/caliper/sensor.rb'
require_relative './event_helper'

module Caliper

  describe Sensor do
  	include Helper

    it "should ensure that we can create and send an event" do

      options = {
        'host'  => 'http://requestb.in/s58ekgs5'
      }

      sensor = Sensor.new options
      event  = session_event

      sensor.send event

    end

  end
end
