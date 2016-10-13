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

require 'time'
require 'json'
require_relative './entity'
require_relative './entity_type'
require_relative '../context/context'
require_relative './schemadotorg/thing'
require_relative './jsonable'

#
# The base Caliper Entity.  Analogous to a schema.org Thing.
#
module Caliper
  module Entities
    class EntityBase < Entity
      include Caliper::Entities::SchemaDotOrg::Thing, Caliper::Entities::Jsonable

      attr_accessor :name, :description, :extensions, :dateCreated, :dateModified

      def initialize
        super
        @name = nil
        @description = nil
        @extensions = {}
        @dateCreated = nil
        @dateModified = nil
      end
    end
  end
end
