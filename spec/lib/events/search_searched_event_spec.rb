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

describe Caliper::Events::SearchEvent do
  subject do
    described_class.new(
      actor: actor,
      action: Caliper::Actions::SEARCHED,
      edApp: edApp,
      eventTime: '2018-11-15T10:05:00.000Z',
      group: group,
      id: 'urn:uuid:cb3878ed-8240-4c6d-9fee-77221810f5e4',
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

  let(:object) do
    Caliper::Entities::Agent::SoftwareApplication.new(
      id: 'https://example.edu/catalog'
    )
  end

  let(:generated) do
    Caliper::Entities::Search::SearchResponse.new(
        id: 'https://example.edu/users/554433/response?query=IMS%20AND%20%28Caliper%20OR%20Analytics%29',
        searchProvider: search_provider,
        searchTarget: object,
        query: query,
        searchResultsItemCount: 3
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

  let(:session) do
    Caliper::Entities::Session::Session.new(
      id: 'https://example.edu/sessions/1f6442a482de72ea6ad134943812bff564a76259',
      startedAtTime: '2018-11-15T10:00:00.000Z'
    )
  end
  let(:search_provider) do
    Caliper::Entities::Agent::SoftwareApplication.new(
      id: 'https://example.edu',
    )
  end

  let(:query) do
    Caliper::Entities::Search::Query.new(
        id: 'https://example.edu/users/554433/search?query=IMS%20AND%20%28Caliper%20OR%20Analytics%29',
        creator: actor,
        searchTarget: object,
        searchTerms: 'IMS AND (Caliper OR Analytics)',
        dateCreated: '2018-11-15T10:05:00.000Z',
    )
  end

  include_examples 'validation against common fixture', 'caliperEventSearchSearched.json'
end
