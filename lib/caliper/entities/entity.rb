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

require_relative './entity_type'

#
# The base Caliper Entity.  Analogous to a schema.org Thing.
#
module Caliper
  module Entities
    class Entity
      include Caliper::Contexts
      include Caliper::Jsonable
      include Caliper::Properties
      include Caliper::Types

      attr_accessor :id

      caliper_type Caliper::Entities::EntityType::ENTITY

      caliper_context Caliper::Contexts::CONTEXT

      caliper_property :dateCreated
      caliper_property :dateModified
      caliper_property :description
      caliper_property :extensions,   default: []
      caliper_property :name

      def initialize(opts={})
        initialize_context(opts)
        initialize_properties(opts)
        self.id = opts[:id] if opts.has_key?(:id)
      end

      def eql?(other)
        (self.class.properties.keys + [:context, :id, :type]).inject(true) do |eql, key|
          eql && other.respond_to?(key) && (send(key).eql? other.send(key))
        end
      end

      def serialize
        {
          'id' => self.id,
          'type' => self.type
        }
      end

    end
  end
end
