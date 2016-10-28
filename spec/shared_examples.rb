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

shared_examples 'validation against common fixture' do |fixture_filename|
  # Load fixture JSON from caliper-common-fixtures, which should be symlinked under spec/fixtures.
  let(:fixture_json) { File.read("spec/fixtures/#{fixture_filename}") }

  it 'should be equal in serialized form' do
    expect(subject.to_json).to be_json_eql(fixture_json)
  end

  it 'should be equal in deserialized form' do
    deserialized_fixture = described_class.from_json fixture_json
    expect(subject).to eql(deserialized_fixture)
  end
end
