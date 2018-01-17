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

describe Caliper::Request::Envelope do

  let(:creator) do
    Caliper::Entities::Agent::Person.new(
      id: 'https://example.edu/users/223344'
    )
  end

  let(:collection) do
    Caliper::Entities::Resource::DigitalResourceCollection.new(
      id: 'https://example.edu/terms/201601/courses/7/sections/1/resources/1',
      name: 'Course Assets',
      isPartOf: Caliper::Entities::LIS::CourseSection.new(
        id: 'https://example.edu/terms/201601/courses/7/sections/1'
      )
    )
  end

  let(:sensor_id) { 'https://example.edu/sensors/1' }

  let(:sensor_data) do
    Caliper::Entities::Resource::DigitalResource.new(
      id: 'https://example.edu/terms/201601/courses/7/sections/1/resources/1/syllabus.pdf',
      name: 'Course Syllabus',
      mediaType: 'application/pdf',
      creators: [ creator ],
      isPartOf: collection,
      dateCreated: '2016-08-02T11:32:00.000Z'
    )
  end

  include_examples 'payload validation against common fixture', 'caliperEnvelopeEntitySingle.json'
end
