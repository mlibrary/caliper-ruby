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

describe Caliper::Events::OutcomeEvent do
  subject do
    described_class.new(
      action: Caliper::Actions::GRADED,
      actor: actor,
      edApp: edApp,
      eventTime: '2016-11-15T10:57:06.000Z',
      generated: result,
      group: group,
      id: 'urn:uuid:12c05c4e-253f-4073-9f29-5786f3ff3f36',
      object: object
    )
  end

  let(:actor) do
    Caliper::Entities::Agent::SoftwareApplication.new(
      id: 'https://example.edu/autograder',
      version: 'v2'
    )
  end

  let(:edApp) do
    Caliper::Entities::Agent::SoftwareApplication.new(
      id: 'https://example.edu'
    )
  end

  let(:group) do
    Caliper::Entities::LIS::CourseSection.new(
      id: 'https://example.edu/terms/201601/courses/7/sections/1',
      courseNumber: 'CPS 435-01',
      academicSession: 'Fall 2016'
    )
  end

  let(:object) do
    Caliper::Entities::Assign::Attempt.new(
      id: 'https://example.edu/terms/201601/courses/7/sections/1/assess/1/items/3/users/554433/attempts/1',
      assignable: Caliper::Entities::Resource::AssessmentItem.new(
        id: 'https://example.edu/terms/201601/courses/7/sections/1/assess/1/items/3',
        name: 'Assessment Item 3',
        isPartOf: Caliper::Entities::Resource::Assessment.new(
          id: 'https://example.edu/terms/201601/courses/7/sections/1/assess/1'
        )
      ),
      assignee: Caliper::Entities::Agent::Person.new(
        id: 'https://example.edu/users/554433',
      ),
      count: 1,
      dateCreated: '2016-11-15T10:15:02.000Z',
      startedAtTime: '2016-11-15T10:15:02.000Z',
      endedAtTime: '2016-11-15T10:15:12.000Z',
      isPartOf: Caliper::Entities::Assign::Attempt.new(
        id: 'https://example.edu/terms/201601/courses/7/sections/1/assess/1/users/554433/attempts/1'
      )
    )
  end

  let(:result) do
    Caliper::Entities::Assign::Result.new(
      id: 'https://example.edu/terms/201601/courses/7/sections/1/assess/1/items/3/users/554433/results/1',
      attempt: object,
      normalScore: 1.0,
      totalScore: 1.0,
      scoredBy: actor,
      dateCreated: '2016-11-15T10:55:05.000Z'
    )
  end

  # 'object.assignee' in the common fixture is not coerced to an IRI.
  include_examples 'validation against common fixture', 'caliperEventOutcomeGradedItem.json', excluding: 'assignee'
end

