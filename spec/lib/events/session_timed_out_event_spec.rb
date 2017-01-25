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

describe Caliper::Events::SessionEvent do
  subject do
    described_class.new(
      actor: ed_app,
      action: Caliper::Actions::TIMED_OUT,
      edApp: ed_app,
      eventTime: '2016-11-15T11:15:00.000Z',
      object: session,
      uuid: '4e61cf6c-ffbe-45bc-893f-afe7ad4079dc'
    )
  end

  let(:ed_app) do
    Caliper::Entities::Agent::SoftwareApplication.new(
      id: 'https://example.edu'
    )
  end

  let(:session) do
    Caliper::Entities::Session::Session.new(
      id: 'https://example.edu/sessions/7d6b88adf746f0692e2e873308b78c60fb13a864',
      actor: Caliper::Entities::Agent::Person.new(
        id: 'https://example.edu/users/112233'
      ),
      dateCreated: '2016-11-15T10:15:00.000Z',
      startedAtTime: '2016-11-15T10:15:00.000Z',
      endedAtTime: '2016-11-15T11:15:00.000Z',
      duration: 'PT3600S'
    )
  end

  include_examples 'validation against common fixture', 'caliperEventSessionTimedOut.json'
end
