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
      def deserialize(obj, context=nil, references_by_id={}, unique_ids={})
        case obj
          when Hash
            context = obj['@context'] if obj['@context']
            if (context == Caliper::Contexts::CONTEXT) && obj['type'] && (klass = Caliper::Types.class_for_type obj['type'])
              if obj['id'] && unique_ids[obj['id']]
                return unique_ids[obj['id']]
              end
              opts = obj.each_with_object({}) do |(k,v), opts_hash|
                key = k.sub(/\A@/,'').to_sym
                # If a child object is an IRI string, the parent object's class definition may
                # specify a type.
                if v.is_a?(String) && klass.properties[key] && klass.properties[key][:type]
                  serialized = {
                    'id' => v,
                    'type' => klass.properties[key][:type]
                  }
                else
                  serialized = v
                end
                opts_hash[key] = deserialize(serialized, context, references_by_id, unique_ids)
              end
              deserialized = klass.new(opts)
              opts.each do |key, child_object|
                if child_object.respond_to?(:id) && klass.properties[key]
                  references_by_id[child_object.id] ||= []
                  # If this property is specified as unique, any previously deserialized references to the
                  # same id should be updated to point to the newly deserialized object.
                  if klass.properties[key][:unique]
                    references_by_id[child_object.id].each do |reference|
                      reference[0].send "#{reference[1]}=", child_object
                    end
                    unique_ids[child_object.id] = child_object
                  # Alternatively, if the property has a specified type, keep track of the reference in
                  # case a unique object with the same id is deserialized later.
                  elsif klass.properties[key][:type]
                    references_by_id[child_object.id] << [deserialized, key]
                  end
                end
              end
              deserialized
            else
              Hash[obj.map { |k,v| [k.to_sym, deserialize(v, context, references_by_id, unique_ids)] }]
            end
          when Array
            obj.map { |element| deserialize(element, context, references_by_id, unique_ids) }
          else
            obj
        end
      end

      # Before encoding to JSON, recursively serialize Caliper objects into simpler collections, using 'serialize'
      # and 'properties' methods provided by those objects. Omit nil/empty and redundant properties.
      def serialize(obj, context=nil, unique_ids=[], parent_property_definition={})
        # If this object's type is known and its id has been marked unique, return id string only, unless the parent
        # property definition also includes 'unique' to indicate that the object should here be serialized in full.
        if obj.respond_to?(:id) && unique_ids.include?(obj.id) && parent_property_definition[:type] && !parent_property_definition[:unique]
          obj.id
        elsif obj.respond_to?(:serialize)
          serialized = obj.serialize
          if obj.respond_to?(:context) && !obj.context.nil? && obj.context != context
            serialized['@context'] = context = obj.context
          end
          if obj.respond_to?(:properties)
            # Note any properties marked 'unique', as associated objects should be serialized in full only once.
            # Any other references to the same object should be serialized as id string only.
            obj.class.properties.each do |property_name, property_definition|
              if property_definition[:unique]
                if (child_object = obj.send property_name) && child_object.respond_to?(:id)
                  unique_ids << child_object.id
                end
              end
            end
            # Serialize each child object, passing in the property definition from the parent object class.
            obj.properties.each do |key, value|
              unless value.nil? || (value.respond_to?(:empty?) && value.empty?)
                property_definition = obj.class.properties[key].merge(key: key)
                serialized[key.to_s] = serialize(value, context, unique_ids, property_definition)
              end
            end
          end
          # If the object has no properties but id and type, and the type is already known from the parent object
          # definition, return id string only.
          if (serialized.keys - %w(id type)).empty? && serialized['type'] == parent_property_definition[:type]
            serialized['id']
          # Otherwise return the entire serialized object.
          else
            serialized
          end
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
