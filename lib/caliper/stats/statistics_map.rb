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
# Statistics map.
#
module Caliper
  module Stats
    class StatisticsMap < Hash

      # Make sure the key value exists in the hashmap.
      # Add the key value if not found before.
      def ensure(key)
        # Returns keyed value if key exists.
        if has_key?(key)
          return fetch(key)
        end

        # else insert the key
        statistic = Statistic.new
        self.put(key, statistic)
        statistic
      end

      # Insert a new Statistic object if there is no key with specified value.
      # Otherwise, update the hashed value with the value provided.
      def update(operation, val)
        if !has_key?(operation)
          self.put(operation, Statistic.new)
        end
        self.fetch(operation).update(val)
      end

      # the pretty formatted string output
      def to_s
        r_string = "\n-------- Caliper Java Statistics --------\n"
        hash.each do |key, value|
          r_string << "#{key} : #{value}\n"
        end
        r_string
      end
    end
  end
end
