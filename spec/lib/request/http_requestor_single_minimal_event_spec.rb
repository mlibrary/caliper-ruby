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

require 'require_all'
require_all 'lib/caliper/actions/reading_actions.rb'
require_all 'lib/caliper/entities/entity.rb'
require_all 'lib/caliper/events/event.rb'
require_all 'lib/caliper/options.rb'
require_all 'lib/caliper/request/http_requestor.rb'
require_all 'lib/caliper/sensor.rb'

require 'json_spec'

module Caliper
  module Request

    describe Envelope do

      it 'should ensure that a Caliper envelope comprising a minimalist event is correctly created and serialized' do

        # Actor
        actor = Caliper::Entities::Entity.new
        actor.context = nil
        actor.id = 'https://example.edu/user/554433'
        actor.type = 'http://purl.imsglobal.org/caliper/v1/lis/Person'
        # puts "new minimal actor entity = #{actor.to_json}"

        # Action
        action = Caliper::Actions::ReadingActions::VIEWED

        obj = Caliper::Entities::Entity.new
        obj.context = nil
        obj.id = 'https://example.com/viewer/book/34843#epubcfi(/4/3)'
        obj.type = 'http://purl.imsglobal.org/caliper/v1/EpubVolume'
        # puts "new minimal object entity = #{obj.to_json}"

        # Create the Event
        event = Caliper::Events::Event.new
        event.actor = actor
        event.action = action
        event.object = obj
        event.eventTime = Time.utc(2015,9,15,10,15,0).iso8601(3)

        # The Sensor
        options = Caliper::Options.new
        sensor = Caliper::Sensor.new("https://example.edu/sensor/001", options)
        requestor = Caliper::Request::HttpRequestor.new(options)
        json_payload = requestor.generate_payload(sensor, event)

        # Swap out sendTime=DateTime.now() in favor of fixture value (or test will most assuredly fail).
        json_payload_sub = json_payload.sub(/\"sendTime\":\"[^\"]*\"/, "\"sendTime\":\"2015-09-15T11:05:01.000Z\"")

        # Load JSON from caliper-common-fixtures for comparison
        # NOTE - sym link to caliper-common-fixtures needs to exist under spec/fixtures
        file = File.read('spec/fixtures/caliperEnvelopeEventViewViewedMinimal.json')
        data_hash = JSON.parse(file)
        expected_json = data_hash.to_json # convert hash back to JSON string after parse
        expect(json_payload_sub).to be_json_eql(expected_json)

        # puts "JSON from file = #{data_hash}"
        # deser_envelope = Caliper::Request::Envelope.new
        # deser_envelope.from_json data_hash
        # puts "Envelope from JSON = #{deser_envelope.to_json}"

        # Ensure that the deserialized shared event object conforms
        # expect(json_payload_sub).to eql(deser_envelope)
      end
    end
  end
end