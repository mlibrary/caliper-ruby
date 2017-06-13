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

    class ExtendedGeneratorState < JSON::Ext::Generator::State
      attr_accessor :optimize
      attr_accessor :unique_ids

      def initialize(opts={})
        # Default optimization settings are to serialize actor, object and group properties in full.
        @optimize = opts[:optimize] || {except: [:actor, :object, :group]}
        @unique_ids = opts[:unique_ids] || {}
      end
    end

    def self.included(base)
      base.extend ClassMethods
    end

    def to_json(*a)
      if a.first.is_a? ExtendedGeneratorState
        state = a.first
      else
        if a.first.respond_to?(:[])
          optimize = a.first[:optimize]
          unique_ids = a.first[:unique_ids]
        end
        state = ExtendedGeneratorState.new(optimize: optimize, unique_ids: unique_ids)
      end
      self.class.serialize(self, {optimize: state.optimize}, nil, state.unique_ids).to_json(state)
    end

    module ClassMethods
      def from_json(json_string)
        json_obj = JSON.parse json_string
        deserialize json_obj
      end

      # After initial JSON parsing, recursively deserialize basic collection objects into Caliper classes where
      # appropriate.
      def deserialize(obj, context=nil, references_by_id={}, objects_by_id={})
        case obj
          when Hash
            context = obj['@context'] if obj['@context']
            if (context == Caliper::Contexts::CONTEXT) && obj['type'] && (klass = Caliper::Types.class_for_type obj['type'])
              deserialized = klass.new(id: obj['id'])
              obj.each do |k ,v|
                next if %w(id type).include? k
                key = k.sub(/\A@/,'').to_sym
                # If a child object is an IRI string, the parent object's class definition may
                # specify a type.
                serialized = if v.is_a?(String) && klass.properties[key] && klass.properties[key][:type]
                               {
                                 'id' => v,
                                 'type' => klass.properties[key][:type]
                               }
                             else
                               v
                             end
                child_object = deserialize(serialized, context, references_by_id, objects_by_id)
                deserialized.send "#{key}=", child_object
                if child_object.respond_to? :id
                  if objects_by_id[child_object.id]
                    if objects_by_id[child_object.id].class < child_object.class
                      child_object.properties.each do |key, value|
                        unless value.nil? || (value.respond_to?(:empty?) && value.empty?)
                          objects_by_id[child_object.id].send "#{key}=", value
                        end
                      end
                    else
                      objects_by_id[child_object.id].properties.each do |key, value|
                        unless value.nil? || (value.respond_to?(:empty?) && value.empty?)
                          child_object.send "#{key}=", value
                        end
                      end
                      objects_by_id[child_object.id] = child_object
                    end
                  else
                    objects_by_id[child_object.id] = child_object
                  end
                  references_by_id[child_object.id] ||= []
                  references_by_id[child_object.id] << [deserialized, key]
                  references_by_id[child_object.id].each do |reference|
                    reference[0].send "#{reference[1]}=", objects_by_id[child_object.id]
                  end
                end
              end
              deserialized
            else
              Hash[obj.map { |k,v| [k.to_sym, deserialize(v, context, references_by_id, objects_by_id)] }]
            end
          when Array
            obj.map { |element| deserialize(element, context, references_by_id, objects_by_id) }
          when String
            objects_by_id[obj] || obj
          else
            obj
        end
      end

      # Before encoding to JSON, recursively serialize Caliper objects into simpler collections, using 'serialize'
      # and 'properties' methods provided by those objects. Omit nil/empty and redundant properties.
      def serialize(obj, opts, context=nil, unique_ids={}, parent_property_definition={})
        # If this object's type is known and its id has been marked unique, return id string only, unless the parent
        # property definition also includes 'unique' to indicate that the object should here be serialized in full.
        if obj.respond_to?(:serialize)
          serialized = obj.serialize
          if obj.respond_to?(:context) && !obj.context.nil? && obj.context != context
            serialized['@context'] = context = obj.context
          end
          if obj.respond_to?(:properties)
            # Serialize each child object, passing in the property definition from the parent object class.
            obj.properties.each do |key, value|
              unless value.nil? || (value.respond_to?(:empty?) && value.empty?)
                property_definition = obj.class.properties[key].merge(key: key)
                serialized[key.to_s] = serialize(value, opts, context, unique_ids, property_definition)
              end
            end
          end
          if serialize_to_id?(opts, obj, serialized, unique_ids, parent_property_definition)
            serialized['id']
          else
            unique_ids[serialized['id']] = obj if opts[:optimize] != :none
            serialized
          end
        elsif obj.is_a?(Array)
          obj.map { |element| serialize(element, opts, context, unique_ids) }
        elsif obj.is_a?(Hash)
          Hash[obj.map { |k,v| [k, serialize(v, opts, context, unique_ids)] }]
        else
          obj
        end
      end

      def serialize_to_id?(opts, obj, serialized, unique_ids, parent_property_definition)
        # Do not serialize to id unless optimization settings allow.
        return false unless optimize_key?(opts, parent_property_definition[:key])
        # Serialize to id if we've already serialized the same object.
        return true if unique_ids[serialized['id']] == obj
        # Otherwise, serialize only if the object contains only id and type, and 1) another object with the same id has
        # already been serialized, or 2) the type can be inferred from the parent definition (or is a generic Entity).
        if (serialized.keys - %w(id type)).empty? &&
           (unique_ids.has_key?(serialized['id']) || [parent_property_definition[:type], 'Entity'].include?(serialized['type']))
          true
        else
          false
        end
      end

      def optimize_key?(opts, key)
        opts[:optimize] == :all || (opts[:optimize].is_a?(Hash) && opts[:optimize][:except] && !opts[:optimize][:except].include?(key))
      end

    end
  end
end
