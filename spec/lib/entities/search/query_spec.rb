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

describe Caliper::Entities::Search::Query do
  subject do
    described_class.new(
      id: 'https://example.edu/users/554433/search?query=IMS%20AND%20%28Caliper%20OR%20Analytics%29',
      creator: actor,
      searchTarget: search_target,
      searchTerms: 'IMS AND (Caliper OR Analytics)',
      dateCreated: '2018-11-15T10:05:00.000Z',
    )
  end

  let(:actor) do
    Caliper::Entities::Agent::Person.new(
      id: 'https://example.edu/users/554433',
    )
  end

  let(:search_target) do
    Caliper::Entities::Agent::SoftwareApplication.new(
      id: 'https://example.edu/catalog',
    )
  end

  include_examples 'validation against common fixture', 'caliperEntityQuery.json', optimize: :none
end
