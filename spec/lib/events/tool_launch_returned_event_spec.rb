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

describe Caliper::Events::ToolLaunchEvent do
  subject do
    described_class.new(
      action: Caliper::Actions::RETURNED,
      actor: actor,
      edApp: ed_app,
      eventTime: '2018-11-15T10:15:00.000Z',
      federatedSession: federated_session,
      referrer: referrer,
      group: group,
      id: 'urn:uuid:a2e8b214-4d4a-4456-bb4c-099945749117',
      membership: membership,
      object: object,
      session: session,
      target: target
    )
  end

  let(:actor) do
    Caliper::Entities::Agent::Person.new(
      id: 'https://example.edu/users/554433',
    )
  end

  let(:ed_app) do
    Caliper::Entities::Agent::SoftwareApplication.new(
      id: 'https://example.edu'
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
        Caliper::Entities::LIS::Role::LEARNER
      ],
      status: Caliper::Entities::LIS::Status::ACTIVE,
      dateCreated: '2018-08-01T06:00:00.000Z'
    )
  end

  let(:object) do
    Caliper::Entities::Agent::SoftwareApplication.new(
      id: 'https://example.com/lti/tool'
    )
  end

  let(:referrer) do
    Caliper::Entities::Link::LtiLink.new(
      id: 'https://tool.com/lti/123',
    )
  end

  let(:target) do
    Caliper::Entities::Link::Link.new(
      id: 'https://example.edu/terms/201801/courses/7/sections/1/pages/1'
    )
  end

  let(:session) do
    Caliper::Entities::Session::Session.new(
      id: 'https://example.edu/sessions/1f6442a482de72ea6ad134943812bff564a76259',
      startedAtTime: '2018-11-15T10:00:00.000Z'
    )
  end

  let(:federated_session) do
    Caliper::Entities::Session::LtiSession.new(
      id: 'https://example.edu/lti/sessions/b533eb02823f31024e6b7f53436c42fb99b31241',
      user: actor,
      dateCreated: '2018-11-15T10:15:00.000Z',
      startedAtTime: '2018-11-15T10:15:00.000Z'
    )
  end

  include_examples 'validation against common fixture', 'caliperEventToolLaunchReturned.json', optimize: {except: [:edApp, :user, :object]}
end
