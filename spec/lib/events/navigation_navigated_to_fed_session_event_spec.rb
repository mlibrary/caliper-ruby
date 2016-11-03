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

describe Caliper::Events::NavigationEvent do
  subject do
    described_class.new(
      action: Caliper::Actions::NAVIGATED_TO,
      actor: actor,
      edApp: ed_app,
      eventTime: '2016-11-15T10:15:00.000Z',
      federatedSession: federated_session,
      group: group,
      membership: membership,
      object: object,
      referrer: referrer,
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

  let(:federated_session) do
    Caliper::Entities::Session::LtiSession.new(
      id: 'https://example.com/sessions/b533eb02823f31024e6b7f53436c42fb99b31241',
      actor: actor,
      launchParameters: {
        lti_message_type: 'basic-lti-launch-request',
        lti_version: 'LTI-2p0',
        resource_link_id: '88391-e1919-bb3456',
        context_id: '8213060-006f-27b2066ac545',
        launch_presentation_document_target: 'iframe',
        launch_presentation_height: 240,
        launch_presentation_return_url: 'https://example.edu/terms/201601/courses/7/sections/1/pages/5',
        launch_presentation_width: 320,
        roles: 'Learner,Student',
        tool_consumer_instance_guid: 'example.edu',
        user_id: '0ae836b9-7fc9-4060-006f-27b2066ac545',
        context_type: 'CourseSection',
        launch_presentation_locale: 'en-US',
        launch_presentation_css_url: 'https://example.edu/css/tool.css',
        role_scope_mentor: 'f5b2cc6c-8c5c-24e8-75cc-fac5,dc19e42c-b0fe-68b8-167e-4b1a',
        custom_caliper_session_id: 'https://example.edu/sessions/1f6442a482de72ea6ad134943812bff564a76259',
        custom_context_title: 'CPS 435 Learning Analytics',
        custom_context_label: 'CPS 435',
        custom_resource_link_title: 'LTI tool',
        custom_user_image: 'https://example.edu/users/554433/profile/avatar.jpg',
        ext_vnd_instructor: {
          :'@context' => {
            :'@vocab' => 'http://example.edu/ctx/edu.jsonld',
            sdo: 'http://schema.org/'
          },
          :'@type' => 'Faculty',
          :'sdo:jobTitle' => 'Professor',
          :'sdo:givenName' => 'Trig',
          :'sdo:familyName' => 'Haversine',
          :'sdo:email' => 'trighaversine@example.edu',
          :'sdo:url' => 'https://example.edu/faculty/trighaversine',
          isTenured: true,
          isOnSabbatical: false
        }
      },
      dateCreated: '2016-11-15T10:15:00.000Z',
      startedAtTime: '2016-11-15T10:15:00.000Z'
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

  let(:referrer) do
    Caliper::Entities::Reading::WebPage.new(
      id: 'https://example.edu/terms/201601/courses/7/sections/1/pages/4',
    )
  end

  let(:session) do
    Caliper::Entities::Session::Session.new(
      id: 'https://example.com/sessions/b533eb02823f31024e6b7f53436c42fb99b31241',
      startedAtTime: '2016-11-15T10:00:00.000Z'
    )
  end

  include_examples 'validation against common fixture', 'caliperEventNavigationNavigatedToFedSession.json'
end
