require 'rest_client'
require_relative "options"
require_relative 'jsonable'
##
#
#  @copyright @copyright ©2013 IMS Global Learning Consortium, Inc.  All Rights Reserved.
#  @license For license information contact, info@imsglobal.org
#
# Caliper Sensor Entity Envelope
#
#
module Caliper

  class EntityEnvelope
  	include Caliper::Jsonable

    attr_accessor :apiKey,
      :sensorId,
      :entity
  end
end
