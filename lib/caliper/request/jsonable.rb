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
#  Module that supports ser-des for Caliper Event/JSON
#
module Caliper
  module Request
    module Jsonable

      def self.included(base)
        base.extend ClassMethods
      end

      module ClassMethods
      end

      def to_json(*a)
        # puts 'Jsonable: to_json invoked'
        result = {}
        #result['@context'] = self.context
        #result['@type'] = self.type
        self.instance_variables.each do |key|
          # puts "got key = #{key}"
          next if (key[1..-1] == 'context' || key[1..-1] == 'type')
          value = self.instance_variable_get key
          # puts "setting #{key}: #{value}"
          result[key[1..-1]] = value
        end
        result.to_json(*a)
      end

      def from_json json_hash
        data = json_hash
        # puts "Jsonable: from_json: json_hash = #{json_hash}"
        #self.context = data['@context']
        #self.type = data['@type']
        json_hash.each do | key, value |
          next if (key[1..-1] == 'context' || key[1..-1] == 'type')
          # puts "Jsonable - adding #{key} : #{value}"
          self.instance_variable_set "@#{key}", value
        end
        return self
      end

      def eql?(other)
        @sensor == other.sensor && @sendTime == other.sendTime && @data == other.data
      end
    end
  end
end