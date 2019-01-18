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

describe Caliper::Events::ResourceManagementEvent do
  subject do
    described_class.new(
      actor: actor,
      action: Caliper::Actions::COPIED,
      edApp: edApp,
      eventTime: '2018-11-15T10:05:00.000Z',
      group: group,
      id: 'urn:uuid:d3543a73-e307-4190-a755-5ce7b3187bc5',
      object: object,
      generated: generated,
      membership: membership,
      session: session
    )
  end

  let(:actor) do
    Caliper::Entities::Agent::Person.new(
      id: 'https://example.edu/users/554433',
    )
  end

  let(:edApp) do
    Caliper::Entities::Agent::SoftwareApplication.new(
      id: 'https://example.edu'
    )
  end

  let(:resource_collection) do
    Caliper::Entities::Resource::DigitalResourceCollection.new(
      id: 'https://example.edu/terms/201801/courses/7/sections/1/resources/1',
      name: 'Course Assets',
      isPartOf: group
    )
  end

  let(:object) do
    Caliper::Entities::Resource::DigitalResource.new(
      id: 'https://example.edu/terms/201801/courses/7/sections/1/resources/1/syllabus.pdf',
      name: 'Course Syllabus',
      mediaType: 'application/pdf',
      creators: [ actor ],
      isPartOf: resource_collection,
      dateCreated: '2018-08-02T11:32:00.000Z'
    )
  end

  let(:generated) do
    Caliper::Entities::Resource::DigitalResource.new(
      id: 'https://example.edu/terms/201801/courses/7/sections/1/resources/1/syllabus_copy.pdf',
      name: 'Course Syllabus (copy)',
      mediaType: 'application/pdf',
      creators: [ actor ],
      isPartOf: resource_collection,
      dateCreated: '2018-11-15T10:05:00.000Z'
    )
  end

  let(:group) do
    Caliper::Entities::LIS::CourseSection.new(
      id: 'https://example.edu/terms/201801/courses/7/sections/1',
      courseNumber: 'CPS 435-01',
      academicSession: 'Fall 2018'
    )
  end

  let(:membership) do
    Caliper::Entities::LIS::Membership.new(
      id: 'https://example.edu/terms/201801/courses/7/sections/1/rosters/1',
      member: actor,
      organization: group,
      roles: [
        Caliper::Entities::LIS::Role::INSTRUCTOR
      ],
      status: Caliper::Entities::LIS::Status::ACTIVE,
      dateCreated: '2018-08-01T06:00:00.000Z'
    )
  end

  let(:session) do
    Caliper::Entities::Session::Session.new(
      id: 'https://example.edu/sessions/1f6442a482de72ea6ad134943812bff564a76259',
      startedAtTime: '2018-11-15T10:00:00.000Z'
    )
  end

  include_examples 'validation against common fixture', 'caliperEventResourceManagementCopied.json', excluding: [:creators, :isPartOf]
end
