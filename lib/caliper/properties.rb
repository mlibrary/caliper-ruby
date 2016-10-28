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
# Module allowing Caliper classes to declare properties.
#
# The 'caliper_property' class method declares a property name and optional default value on a class. The default value
# will be set to nil if not specified. Properties and default values are inherited by subclasses.
#
# On object initialization, an instance variable with accessors is created for each property. Property values may be
# specified through an options hash; any properties not specified will be set to the class-declared defaults.
#
module Caliper
  module Properties

    # During object initialization, set properties from the options hash, falling back to class-defined defaults
    # when not specified.
    def initialize_properties(opts)
      self.class.properties.each do |prop_key, prop_attributes|
        value = opts.has_key?(prop_key) ? opts[prop_key] : self.class.safe_dup(prop_attributes[:default])
        send "#{prop_key}=", value
      end
    end

    # Return property names and values as a hash.
    def properties
      self.class.properties.each_key.with_object({}) do |key, props|
        props[key] = send(key)
      end
    end

    module ClassMethods
      # Declare a property for a class, with optional default value.
      def caliper_property(property, opts={})
        attr_accessor property
        properties[property] = opts
      end

      # Get property names and default values for a class. Default values are store as shallow-copied class instance
      # variables to avoid unexpected inheritance behavior.
      def properties
        @properties ||= superclass.respond_to?(:properties) ? safe_dup(superclass.properties) : {}
      end

      # Safely handle non-dupable objects such as nil and Fixnum.
      def safe_dup(obj)
        obj.dup
      rescue TypeError
        obj
      end
    end

    def self.included(base)
      base.extend ClassMethods
    end
  end
end
