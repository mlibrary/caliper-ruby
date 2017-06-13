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
      group: group,
      id: 'urn:uuid:71657137-8e6e-44f8-8499-e1c3df6810d2',
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
      id: 'https://example.edu'
    )
  end

  let(:group) do
    Caliper::Entities::Agent::Organization.new(
      id: 'https://example.edu/terms/201601/courses/7/sections/1'
    )
  end

  let(:membership) do
    Caliper::Entities::LIS::Membership.new(
      id: 'https://example.edu/terms/201601/courses/7/sections/1/rosters/1'
    )
  end

  let(:object) do
    Caliper::Entities::Entity.new(
      id: 'https://example.edu/terms/201601/courses/7/sections/1/pages/2'
    )
  end

  let(:referrer) do
    Caliper::Entities::Entity.new(
      id: 'https://example.edu/terms/201601/courses/7/sections/1/pages/1',
    )
  end

  let(:session) do
    Caliper::Entities::Session::Session.new(
      id: 'https://example.edu/sessions/1f6442a482de72ea6ad134943812bff564a76259'
    )
  end

  include_examples 'validation against common fixture', 'caliperEventNavigationNavigatedToThinned.json', optimize: :all
end
