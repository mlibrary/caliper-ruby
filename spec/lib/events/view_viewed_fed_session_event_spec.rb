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

describe Caliper::Events::ViewEvent do
  subject do
    described_class.new(
      action: Caliper::Actions::VIEWED,
      actor: actor,
      edApp: ed_app,
      eventTime: '2016-11-15T10:20:00.000Z',
      federatedSession: federated_session,
      group: group,
      id: 'urn:uuid:4be6d29d-5728-44cd-8a8f-3d3f07e46b61',
      membership: membership,
      object: object,
      session: session
    )
  end

  let(:actor) do
    Caliper::Entities::Agent::Person.new(
      id: 'https://example.edu/users/554433',
    )
  end

  let(:ed_app) do
    Caliper::Entities::Agent::SoftwareApplication.new(
      id: 'https://example.com'
    )
  end

  let(:group) do
    Caliper::Entities::LIS::CourseSection.new(
      id: 'https://example.edu/terms/201601/courses/7/sections/1',
      extensions: {
        edu_example_course_section_instructor: 'https://example.edu/faculty/1234'
      }
    )
  end

  let(:membership) do
    Caliper::Entities::LIS::Membership.new(
      id: 'https://example.edu/terms/201601/courses/7/sections/1/rosters/1',
      member: actor,
      organization: group,
      roles: [
        Caliper::Entities::LIS::Role::LEARNER
      ],
      status: Caliper::Entities::LIS::Status::ACTIVE,
      dateCreated: '2016-08-01T06:00:00.000Z'
    )
  end

  let(:object) do
    Caliper::Entities::Reading::Document.new(
      id: 'https://example.com/lti/reader/202.epub',
      name: 'Caliper Case Studies',
      mediaType: 'application/epub+zip',
      dateCreated: '2016-08-01T09:00:00.000Z'
    )
  end

  let(:session) do
    Caliper::Entities::Session::Session.new(
      dateCreated: '2016-11-15T10:20:00.000Z',
      id: 'https://example.com/sessions/c25fd3da-87fa-45f5-8875-b682113fa5ee',
      startedAtTime: '2016-11-15T10:20:00.000Z'
    )
  end

  let(:federated_session) do
    Caliper::Entities::Session::LtiSession.new(
      id: 'urn:uuid:1c519ff7-3dfa-4764-be48-d2fb35a2925a',
      user: actor,
      messageParameters: {
        lti_message_type: 'basic-lti-launch-request',
        lti_version: 'LTI-2p0',
        context_id: '4f1a161f-59c3-43e5-be37-445ad09e3f76',
        context_type: 'CourseSection',
        resource_link_id: '6b37a950-42c9-4117-8f4f-03e6e5c88d24',
        roles: [
          'Learner'
        ],
        user_id: '0ae836b9-7fc9-4060-006f-27b2066ac545',
        custom: {
          caliper_profile_url: 'https://example.edu/lti/tc/cps',
          caliper_session_id: '1c519ff7-3dfa-4764-be48-d2fb35a2925a',
          tool_consumer_instance_url: 'https://example.edu'
        },
        ext: {
          edu_example_course_section: group,
          edu_example_course_section_instructor: 'https://example.edu/faculty/1234',
          edu_example_course_section_learner: actor,
          edu_example_course_section_roster: membership
        }
      },
      dateCreated: '2016-11-15T10:15:00.000Z',
      startedAtTime: '2016-11-15T10:15:00.000Z'
    )
  end

  include_examples(
    'validation against common fixture',
    'caliperEventViewViewedFedSession.json',
    # The fixture serializes event properties out of alphabetical order, resulting in a different
    # optimization structure.
    excluding: ['membership', 'edu_example_course_section', 'edu_example_course_section_roster']
  )
end
