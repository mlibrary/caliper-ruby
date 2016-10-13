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
# Statistics.
#
module Caliper
  module Stats
    class Statistics < StatisticsMap
      MEASURE_KEY = 'Measure'
      DESCRIBE_KEY = 'Describe'
      SUCCESSFUL_KEY = 'Successful'
      FAILED_KEY = 'Failed'

      # Returns the statistic representing how many describe calls happened
      def get_describes
        ensure(DESCRIBE_KEY)
      end

      def update_describes(val)
        update(DESCRIBE_KEY, val)
      end

      def get_measures
        ensure(MEASURE_KEY)
      end

      def update_measures(val)
        update(MEASURE_KEY, val)
      end

      def get_successful
        ensure(SUCCESSFUL_KEY)
      end

      def update_successful
        update(SUCCESSFUL_KEY, val)
      end

      def get_failed
        ensure(FAILED_KEY)
      end

      def update_failed
        update(FAILED_KEY, val)
      end
    end
  end
end
