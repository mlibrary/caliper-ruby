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

require 'json'

#
# Module that supports serialization/deserialization for Caliper JSON.
#
module Caliper
  module Jsonable

    def self.included(base)
      base.extend ClassMethods
    end

    def to_json(*a)
      self.class.serialize(self).to_json(*a)
    end

    module ClassMethods
      def from_json(json_string)
        json_obj = JSON.parse json_string
        deserialize json_obj
      end

      # After initial JSON parsing, recursively deserialize basic collection objects into Caliper classes where
      # appropriate.
      def deserialize(obj)
        case obj
          when Hash
            if obj['type'] && (klass = Caliper::Types.class_for_type obj['type'])
              opts = obj.each_with_object({}) do |(k,v), opts_hash|
                key = k.sub(/\A@/,'').to_sym
                opts_hash[key] = deserialize v
              end
              klass.new(opts)
            else
              Hash[obj.map { |k,v| [k.to_sym, deserialize(v)] }]
            end
          when Array
            obj.map { |element| deserialize element }
          else
            obj
        end
      end

      # Before encoding to JSON, recursively serialize Caliper objects into simpler collections, using 'serialize'
      # and 'properties' methods provided by those objects. Omit nil/empty properties and redundant contexts.
      def serialize(obj, context=nil)
        if obj.respond_to?(:serialize)
          serialized = obj.serialize
          if obj.respond_to?(:context) && !obj.context.nil? && obj.context != context
            serialized['@context'] = context = obj.context
          end
          if obj.respond_to?(:properties)
            obj.properties.each do |key, value|
              unless value.nil? || (value.respond_to?(:empty?) && value.empty?)
                serialized[key.to_s] = serialize(value, context)
              end
            end
          end
          serialized
        elsif obj.is_a?(Array)
          obj.map { |element| serialize(element, context) }
        elsif obj.is_a?(Hash)
          Hash[obj.map { |k,v| [k, serialize(v, context)] }]
        else
          obj
        end
      end
    end
  end
end
