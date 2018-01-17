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

require_relative './options'
require_relative './request/http_requestor'

#
# Caliper Sensor.
#
module Caliper
  class Sensor

    attr_accessor :id

    def initialize(id, options)
      @id = id
      @options = options
    end

    def describe(entity)
      raise ArgumentError, "Expecting Caliper::Entity but got #{entity.class.to_s}" unless entity.is_a?(Caliper::Entities::Entity)

      HttpRequestor.new(@options).send(self, entity)
    end

    def send(event)
      raise ArgumentError, "Expecting Caliper::Event but got #{event.class.to_s}" unless event.is_a?(Caliper::Events::Event)

      HttpRequestor.new(@options).send(self, event)
    end
  end
end
