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

require_relative '../contexts'
require_relative '../jsonable'
require_relative '../properties'
require_relative '../types'

require_relative './event_type'

#
# Base event.
#
module Caliper
  module Events
    class Event
      include Caliper::Jsonable
      include Caliper::Contexts
      include Caliper::Properties
      include Caliper::Types

      caliper_context Caliper::Contexts::CONTEXT
      caliper_type Caliper::Events::EventType::EVENT

      caliper_property :actor
      caliper_property :action
      caliper_property :extensions, default: {}
      caliper_property :eventTime
      caliper_property :id
      caliper_property :referrer
      caliper_property :object

      def initialize(opts={})
        initialize_context(opts)
        initialize_properties(opts)
      end

      def eql?(other)
        (self.class.properties.keys + [:context, :type]).inject(true) do |eql, key|
          eql && (send(key).eql? other.send(key))
        end
      end

      def serialize
        {
          'type' => self.type
        }
      end

    end
  end
end
