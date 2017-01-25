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

describe Caliper::Events::AssignableEvent do
  subject do
    described_class.new(
      action: Caliper::Actions::ACTIVATED,
      actor: actor,
      edApp: ed_app,
      eventTime: '2016-11-12T10:15:00.000Z',
      group: group,
      membership: membership,
      object: object,
      session: session,
      uuid: '2635b9dd-0061-4059-ac61-2718ab366f75'
    )
  end

  let(:actor) do
    Caliper::Entities::Agent::Person.new(
      id: 'https://example.edu/users/112233',
    )
  end

  let(:ed_app) do
    Caliper::Entities::Agent::SoftwareApplication.new(
      id: 'https://example.edu',
      version: 'v2'
    )
  end

  let(:group) do
    Caliper::Entities::LIS::CourseSection.new(
      id: 'https://example.edu/terms/201601/courses/7/sections/1',
      courseNumber: 'CPS 435-01',
      academicSession: 'Fall 2016'
    )
  end

  let(:membership) do
    Caliper::Entities::LIS::Membership.new(
      id: 'https://example.edu/terms/201601/courses/7/sections/1/rosters/1',
      member: actor,
      organization: Caliper::Entities::LIS::CourseSection.new(
        id: 'https://example.edu/terms/201601/courses/7/sections/1',
      ),
      roles: [
        Caliper::Entities::LIS::Role::INSTRUCTOR
      ],
      status: Caliper::Entities::LIS::Status::ACTIVE,
      dateCreated: '2016-08-01T06:00:00.000Z'
    )
  end

  let(:object) do
    Caliper::Entities::Resource::Assessment.new(
      id: 'https://example.edu/terms/201601/courses/7/sections/1/assess/1',
      name: 'Quiz One',
      dateCreated: '2016-08-01T06:00:00.000Z',
      dateModified: '2016-09-02T11:30:00.000Z',
      datePublished: '2016-11-12T10:10:00.000Z',
      dateToActivate: '2016-11-12T10:15:00.000Z',
      dateToStartOn: '2016-11-14T05:00:00.000Z',
      dateToSubmit: '2016-11-18T11:59:59.000Z',
      maxAttempts: 2,
      maxSubmits: 2,
      maxScore: 25.0,
      version: '1.0'
    )
  end

  let(:session) do
    Caliper::Entities::Session::Session.new(
      id: 'https://example.edu/sessions/f095bbd391ea4a5dd639724a40b606e98a631823',
      startedAtTime: '2016-11-12T10:00:00.000Z'
    )
  end

  include_examples 'validation against common fixture', 'caliperEventAssignableActivated.json'
end
