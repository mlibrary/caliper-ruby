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

require_relative './event'
require_relative './event_context'
require_relative './event_type'

#
# Representation of a tool use event.
#
module Caliper
  module Events
    class ToolUseEvent < Event
      include Caliper::Events::EventContext

      caliper_type Caliper::Events::EventType::TOOL_USE

      caliper_property :object,     type: Caliper::Entities::EntityType::SOFTWARE_APPLICATION
      caliper_property :target,     type: Caliper::Entities::EntityType::SOFTWARE_APPLICATION
      caliper_property :generated,  type: Caliper::Entities::EntityType::AGGREGATE_MEASURE_COLLECTION

      # During object initialization, set properties from the options hash, falling back to class-defined defaults
      # when not specified.
      def initialize_properties(opts)
        self.class.properties.each do |prop_key, prop_attributes|
          value = opts.has_key?(prop_key) ? opts[prop_key] : self.class.safe_dup(prop_attributes[:default])
          send "#{prop_key}=", value

          if prop_key == :generated && ! value.nil?
            @context = Caliper::Contexts::TOOL_USE_PROFILE_EXTENSION
          end
        end
      end

    end
  end
end
