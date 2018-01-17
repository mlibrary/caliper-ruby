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

  let(:assessment) do
    Caliper::Entities::Resource::Assessment.new(
      id:     'https://example.edu/terms/201601/courses/7/sections/1/assess/1?ver=v1p0',
      name:   'Quiz One',
      dateCreated: '2016-08-01T06:00:00.000Z',
      dateModified: '2016-09-02T11:30:00.000Z',
      datePublished: '2016-08-15T09:30:00.000Z',
      dateToActivate: '2016-08-16T05:00:00.000Z',
      dateToShow: '2016-08-16T05:00:00.000Z',
      dateToStartOn: '2016-08-16T05:00:00.000Z',
      dateToSubmit: '2016-09-28T11:59:59.000Z',
      maxAttempts: 2,
      maxScore: 15.0,
      maxSubmits: 2,
      version: '1.0',
      items: [
        Caliper::Entities::Resource::AssessmentItem.new(
          id: 'https://example.edu/terms/201601/courses/7/sections/1/assess/1/items/1'
        ),
        Caliper::Entities::Resource::AssessmentItem.new(
          id: 'https://example.edu/terms/201601/courses/7/sections/1/assess/1/items/2'
        ),
        Caliper::Entities::Resource::AssessmentItem.new(
          id: 'https://example.edu/terms/201601/courses/7/sections/1/assess/1/items/3'
        )
      ]
    )
  end

  let(:ed_app) do
    Caliper::Entities::Agent::SoftwareApplication.new(
      id: 'https://example.edu',
      version: 'v2'
    )
  end

  let(:course_section) do
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

  let(:session) do
    Caliper::Entities::Session::Session.new(
      id: 'https://example.edu/sessions/1f6442a482de72ea6ad134943812bff564a76259',
      startedAtTime: '2016-11-15T10:00:00.000Z'
    )
  end

  let(:assessment_event_started) do
    Caliper::Events::AssessmentEvent.new(
      action: Caliper::Actions::STARTED,
      actor: person,
      edApp: ed_app,
      eventTime: '2016-11-15T10:15:00.000Z',
      generated: Caliper::Entities::Assign::Attempt.new(
        id: 'https://example.edu/terms/201601/courses/7/sections/1/assess/1/users/554433/attempts/1',
        assignee: person,
        assignable: assessment,
        count: 1,
        dateCreated: '2016-11-15T10:15:00.000Z',
        startedAtTime: '2016-11-15T10:15:00.000Z'
      ),
      group: course_section,
      id: 'urn:uuid:c51570e4-f8ed-4c18-bb3a-dfe51b2cc594',
      membership: Caliper::Entities::LIS::Membership.new(
        id: 'https://example.edu/terms/201601/courses/7/sections/1/rosters/1',
        member: person,
        organization: course_section,
        roles: [
          Caliper::Entities::LIS::Role::LEARNER
        ],
        status: Caliper::Entities::LIS::Status::ACTIVE,
        dateCreated: '2016-08-01T06:00:00.000Z'
      ),
      object: assessment,
      session: session
    )
  end

  let(:attempt1) do
    Caliper::Entities::Assign::Attempt.new(
      id: 'https://example.edu/terms/201601/courses/7/sections/1/assess/1/users/554433/attempts/1',
      assignee: person,
      assignable: assessment,
      count: 1,
      dateCreated: '2016-11-15T10:15:00.000Z',
      duration: 'PT40M12S',
      endedAtTime:'2016-11-15T10:55:12.000Z',
      startedAtTime: '2016-11-15T10:15:00.000Z'
    )
  end

  let(:attempt2) do
    Caliper::Entities::Assign::Attempt.new(
      id: 'https://example.edu/terms/201601/courses/7/sections/1/assess/1/users/554433/attempts/1',
      assignee: person,
      assignable: assessment,
      count: 1,
      dateCreated: '2016-11-15T10:15:00.000Z',
      duration: 'PT40M12S',
      endedAtTime:'2016-11-15T10:55:12.000Z',
      startedAtTime: '2016-11-15T10:15:00.000Z'
    )
  end

  let(:assessment_event_submitted) do
    Caliper::Events::AssessmentEvent.new(
      action: Caliper::Actions::SUBMITTED,
      actor: person,
      edApp: ed_app,
      eventTime: '2016-11-15T10:25:30.000Z',
      generated: attempt1,
      group: course_section,
      id: 'urn:uuid:dad88464-0c20-4a19-a1ba-ddf2f9c3ff33',
      membership: Caliper::Entities::LIS::Membership.new(
        id: 'https://example.edu/terms/201601/courses/7/sections/1/rosters/1',
        member: person,
        organization: course_section,
        roles: [
          Caliper::Entities::LIS::Role::LEARNER
        ],
        status: Caliper::Entities::LIS::Status::ACTIVE,
        dateCreated: '2016-08-01T06:00:00.000Z'
      ),
      object: assessment,
      session: session
    )
  end

  let(:autograder) do
    Caliper::Entities::Agent::SoftwareApplication.new(
      id: 'https://example.edu/autograder',
      version: 'v2'
    )
  end

  let(:grade_event) do
    Caliper::Events::GradeEvent.new(
      action: Caliper::Actions::GRADED,
      actor: autograder,
      edApp: ed_app,
      eventTime: '2016-11-15T10:57:06.000Z',
      generated: Caliper::Entities::Assign::Score.new(
        id: 'https://example.edu/terms/201601/courses/7/sections/1/assess/1/users/554433/attempts/1/scores/1',
        attempt: attempt2,
        comment: 'auto-graded exam',
        maxScore: 15.0,
        scoreGiven: 10.0,
        scoredBy: autograder,
        dateCreated: '2016-11-15T10:56:00.000Z'
      ),
      group: course_section,
      id: 'urn:uuid:a50ca17f-5971-47bb-8fca-4e6e6879001d',
      object: attempt2
    )
  end

  let(:sensor_id) { 'https://example.edu/sensors/1' }

  let(:sensor_data) do
    [
      person,
      assessment,
      ed_app,
      course_section,
      assessment_event_started,
      assessment_event_submitted,
      grade_event
    ]
  end

  include_examples(
    'payload validation against common fixture',
    'caliperEnvelopeMixedBatch.json',
    optimize: {except: [:membership, :session]}
  )
end
