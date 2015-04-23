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
