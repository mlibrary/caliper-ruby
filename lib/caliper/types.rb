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

#
# Module allowing Caliper classes to declare types.
#
# The 'caliper_type' class method declares a type for a class. Types are inherited by subclasses and cannot be
# directly declared on instances.
#
module Caliper
  module Types

    # A method call for the type of an instance is delegated to its class.
    def type
      self.class.type
    end

    module ClassMethods
      attr_reader :type
      @@classes = {}

      # Declare a type for a class. Also keep track of the association from type to class in a class variable,
      # allowing objects to be instantiated as the correct class when deserialized from JSON.
      def caliper_type(type)
        @type = type
        @@classes[type] = self
      end

      # Translate type IRI back to the declaring class.
      def class_for_type(type)
        @@classes[type]
      end
    end

    extend ClassMethods

    def self.included(base)
      base.extend ClassMethods
    end
  end
end
