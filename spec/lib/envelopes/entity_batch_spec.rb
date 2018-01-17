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

  let(:person) do
    Caliper::Entities::Agent::Person.new(
      id: 'https://example.edu/users/554433',
      dateCreated: '2016-08-01T06:00:00.000Z',
      dateModified: '2016-09-02T11:30:00.000Z'
    )
  end

  let(:document) do
    Caliper::Entities::Reading::Document.new(
      id: 'https://example.edu/etexts/201.epub',
      name: 'IMS Caliper Implementation Guide',
      creators: [
        Caliper::Entities::Agent::Person.new(
          id: 'https://example.edu/people/12345'
        ),
        Caliper::Entities::Agent::Person.new(
          id: 'https://example.com/staff/56789'
        )
      ],
      dateCreated: '2016-10-01T06:00:00.000Z',
      version: '1.1'
    )
  end

  let(:digital_resource_collection) do
    Caliper::Entities::Resource::DigitalResourceCollection.new(
      id: 'https://example.edu/terms/201601/courses/7/sections/1/resources/2',
      name: 'Video Collection',
      dateCreated: '2016-08-01T06:00:00.000Z',
      dateModified: '2016-09-02T11:30:00.000Z',
      isPartOf: Caliper::Entities::LIS::CourseSection.new(
        id: 'https://example.edu/terms/201601/courses/7/sections/1',
        subOrganizationOf: Caliper::Entities::LIS::CourseOffering.new(
          id: 'https://example.edu/terms/201601/courses/7'
        )
      ),
      items: [
        Caliper::Entities::Resource::VideoObject.new(
          id: 'https://example.edu/videos/1225',
          dateCreated: '2016-08-01T06:00:00.000Z',
          duration: 'PT1H12M27S',
          mediaType: 'video/ogg',
          name: 'Introduction to IMS Caliper',
          version: '1.1'
        ),
        Caliper::Entities::Resource::VideoObject.new(
          id: 'https://example.edu/videos/5629',
          dateCreated: '2016-08-01T06:00:00.000Z',
          duration: 'PT55M13S',
          mediaType: 'video/ogg',
          name: 'IMS Caliper Activity Profiles',
          version: '1.1.1'
        )
      ]
    )
  end

  let(:sensor_id) { 'https://example.edu/sensors/1' }

  let(:sensor_data) do
    [
      person,
      document,
      digital_resource_collection
    ]
  end

  include_examples 'payload validation against common fixture', 'caliperEnvelopeEntityBatch.json'
end
