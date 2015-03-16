require 'require_all'
require_all 'lib/caliper/sensor.rb'

module Caliper

  describe Sensor do

    it "should ensure that we can create and send an event" do

      options = {
        'host'  => 'http+>//requestb.in/s58ekgs5',
        'apiKey'=> 'fake'
      }
      sensor = Sensor.new options

    end

  end
end
