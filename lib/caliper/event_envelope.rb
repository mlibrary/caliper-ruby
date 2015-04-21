require 'rest_client'
require_relative "options"
require_relative 'jsonable'

##
#
#  @copyright @copyright ©2013 IMS Global Learning Consortium, Inc.  All Rights Reserved.
#  @license For license information contact, info@imsglobal.org
#
# Caliper Sensor Event Envelope
#
#
module Caliper

  class EventEnvelope
    include Caliper::Jsonable

    attr_accessor :apiKey,
      :sensorId,
      :event
  end
end
