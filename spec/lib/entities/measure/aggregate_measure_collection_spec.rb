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

require 'spec_helper'

describe Caliper::Entities::Measure::AggregateMeasureCollection do

  subject do
    described_class.new(
      id: 'urn:uuid:60b4db01-f1e5-4a7f-add9-6a8f761625b1',
      items: [
        Caliper::Entities::Measure::AggregateMeasure.new(
          id: 'urn:uuid:21c3f9f2-a9ef-4f65-bf9a-0699ed85e2c7',
          metric: 'MinutesOnTask',
          name: 'Minutes On Task',
          metricValue: 873.0,
          startedAtTime: '2019-08-15T10:15:00.000Z',
          endedAtTime: '2019-11-15T10:15:00.000Z'
        ),
        Caliper::Entities::Measure::AggregateMeasure.new(
          id: 'urn:uuid:c3ba4c01-1f17-46e0-85dd-1e366e6ebb81',
          metric: 'UnitsCompleted',
          name: 'Units Completed',
          metricValue: 12.0,
          maxMetricValue: 25.0,
          startedAtTime: '2019-08-15T10:15:00.000Z',
          endedAtTime: '2019-11-15T10:15:00.000Z'
        )
      ]
    )
  end

  include_examples 'validation against common fixture', 'caliperEntityAggregateMeasureCollection.json', optimize: :none
end
