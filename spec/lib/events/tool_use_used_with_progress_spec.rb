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

describe Caliper::Events::ToolUseEvent do
  subject do
    described_class.new(
      actor: actor,
      action: Caliper::Actions::USED,
      edApp: edApp,
      eventTime: '2019-11-15T10:15:00.000Z',
      group: group,
      generated: generated,
      id: 'urn:uuid:7e10e4f3-a0d8-4430-95bd-783ffae4d916',
      object: object,
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

  let(:object) do
    Caliper::Entities::Agent::SoftwareApplication.new(
      id: 'https://example.edu'
    )
  end

  let(:group) do
    Caliper::Entities::LIS::CourseSection.new(
      id: 'https://example.edu/terms/201601/courses/7/sections/1',
      name: 'CPS 435 Learning Analytics, Section 01',
      academicSession: 'Fall 2016',
      category: 'seminar',
      courseNumber: 'CPS 435-01',
      dateCreated: '2016-08-01T06:00:00.000Z',
      subOrganizationOf: Caliper::Entities::LIS::CourseOffering.new(
        id: 'https://example.edu/terms/201601/courses/7',
        courseNumber: 'CPS 435'
      )
    )
  end

  let(:membership) do
    Caliper::Entities::LIS::Membership.new(
      id: 'https://example.edu/terms/201601/courses/7/sections/1/rosters/1/members/554433',
      member: actor,
      organization: group,
      roles: [
        Caliper::Entities::LIS::Role::LEARNER
      ],
      status: Caliper::Entities::LIS::Status::ACTIVE,
      dateCreated: '2016-11-01T06:00:00.000Z'
    )
  end

  let(:session) do
    Caliper::Entities::Session::Session.new(
      id: 'https://example.edu/sessions/1f6442a482de72ea6ad134943812bff564a76259',
      startedAtTime: '2016-09-15T10:00:00.000Z',
      user: actor
    )
  end

  let (:generated) do
    Caliper::Entities::Measure::AggregateMeasureCollection.new(
      id: 'urn:uuid:7e10e4f3-a0d8-4430-95bd-783ffae4d912',
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

  include_examples 'validation against common fixture', 'caliperEventToolUseUsedWithProgress.json',
    excluding: [:actor, :object, :group, :membership, :session, :member, :organization, :subOrganizationOf, :user]
end
