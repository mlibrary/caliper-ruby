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

require 'concurrent'

#
# Extends the atomic class with several new functions.
#
module Caliper
  module Stats
    class AtomicWrapper < Concurrent::AtomicFixnum

      # Atomically sets to the given value and returns the old value.
      def get_and_set(new_value)
        current = @value
        if compare_and_set(current, new_value)
          current
        end
      end

      # Atomically increments by one and returns the old value.
      def get_and_increment()
        current = @value
        new_value = current + 1
        if compare_and_set(current, new_value)
          current
        end
      end

      # Atomically decrements by one and returns the old value.
      def get_and_decrement()
        current = @value
        new_value = current - 1
        if compare_and_set(current, new_value)
          current
        end
      end

      # Atomically adds the given value to the current value
      # Return the old value
      def get_and_add(delta)
        current = @value
        new_value = current + delta
        if compare_and_set(current, new_value)
          current
        end
      end

      # Atomically increments by one the current value.
      # Return the updated value
      def increment_and_get
        current = @value
        new_value = current + 1
        if compare_and_set(current, new_value)
          new_value
        end
      end

      # Atomically decrements by one the current value.
      # Return the updated value
      def decrement_and_get
        current = @value
        new_value = current - 1
        if compare_and_set(current, new_value)
          new_value
        end
      end

      # Atomically adds the given value to the current value.
      # Return the updated value
      def add_and_get(delta)
        current = @value
        new_value = current + delta
        if compare_and_set(current, new_value)
          new_value
        end
      end

      # Returns the String representation of the current value.
      def to_string
        @value.to_s
      end
    end
  end
end
