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

shared_examples 'validation against common fixture' do |fixture_filename, options|
  options ||= {}

  # Load fixture JSON from caliper-common-fixtures, which should be symlinked under spec/fixtures.
  let(:fixture_json) { File.read("spec/fixtures/#{fixture_filename}") }

  it 'should be equal in serialized form' do
    json = subject.to_json(options)
    expect(json).to be_json_eql(fixture_json).excluding *(options[:excluding] || [])
  end

  it 'should be equal in deserialized form' do
    deserialized_fixture = described_class.from_json fixture_json
    expect(subject).to eql(deserialized_fixture)
  end
end

shared_examples 'payload validation against common fixture' do |fixture_filename, options|
  options ||= {}

  # Load fixture JSON from caliper-common-fixtures, which should be symlinked under spec/fixtures.
  let(:fixture_json) { File.read("spec/fixtures/#{fixture_filename}") }

  let(:caliper_options) { Caliper::Options.new }
  let(:sensor) { Caliper::Sensor.new(sensor_id, caliper_options) }
  let(:requestor) { Caliper::Request::HttpRequestor.new(caliper_options) }

  it 'should correctly create and serialize JSON payload' do
    payload = requestor.generate_payload(sensor, sensor_data, options)

    # Swap out sendTime=DateTime.now() in favor of fixture value (or test will most assuredly fail).
    payload.sub!(/\"sendTime\":\"[^\"]*\"/, '"sendTime": "2016-11-15T11:05:01.000Z"')

    # Load JSON from caliper-common-fixtures for comparison
    expect(payload).to be_json_eql(fixture_json).excluding *(options[:excluding] || [])
  end
end
