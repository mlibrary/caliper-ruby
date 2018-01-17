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

describe Caliper::Entities::Resource::AssignableDigitalResource do

  subject do
    described_class.new(
      id: 'https://example.edu/terms/201601/courses/7/sections/1/assign/2',
      name: 'Week 9 Reflection',
      description: '3-5 page reflection on this week\'s assigned readings.',
      dateCreated: '2016-11-01T06:00:00.000Z',
      dateToActivate: '2016-11-10T11:59:59.000Z',
      dateToShow: '2016-11-10T11:59:59.000Z',
      dateToStartOn: '2016-11-10T11:59:59.000Z',
      dateToSubmit: '2016-11-14T11:59:59.000Z',
      maxAttempts: 2,
      maxScore: 50.0,
      maxSubmits: 2
    )
  end

  include_examples 'validation against common fixture', 'caliperEntityAssignableDigitalResource.json'
end
