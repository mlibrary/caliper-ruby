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

  let(:actor) do
    Caliper::Entities::Agent::Person.new(
      id: 'https://example.edu/users/554433',
    )
  end

  let(:document) do
    Caliper::Entities::Reading::Document.new(
      id: 'https://example.edu/etexts/201.epub'
    )
  end

  it 'should ensure that a Caliper envelope comprising a minimalist event is correctly created and serialized' do
    # Create the Event
    event = Caliper::Events::Event.new(
      actor: actor,
      action: Caliper::Actions::Actions::CREATED,
      object: document,
      eventTime: '2016-11-15T10:15:00.000Z'
    )

    # The Sensor
    options = Caliper::Options.new
    sensor = Caliper::Sensor.new('https://example.edu/sensors/1', options)
    requestor = Caliper::Request::HttpRequestor.new(options)
    json_payload = requestor.generate_payload(sensor, event)

    # Swap out sendTime=DateTime.now() in favor of fixture value (or test will most assuredly fail).
    json_payload.sub!(/\"sendTime\":\"[^\"]*\"/, '"sendTime": "2016-11-15T11:05:01.000Z"')

    # Load JSON from caliper-common-fixtures for comparison
    # NOTE - sym link to caliper-common-fixtures needs to exist under spec/fixtures
    json_string = File.read('spec/fixtures/caliperEnvelopeEventViewViewedMinimal.json')
    expect(json_payload).to be_json_eql(json_string)
  end
end
