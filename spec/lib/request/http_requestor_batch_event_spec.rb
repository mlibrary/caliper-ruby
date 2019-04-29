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
      id: 'https://example.edu/users/554433'
    )
  end

  let(:web_page) do
    Caliper::Entities::Reading::WebPage.new(
      id: 'https://example.edu/terms/201601/courses/7/sections/1/pages/2',
      name: 'Learning Analytics Specifications',
      description: 'Overview of Learning Analytics Specifications with particular emphasis on IMS Caliper.',
      dateCreated: '2016-08-01T09:00:00.000Z'
    )
  end

  let(:annotation) do
    Caliper::Entities::Annotation::BookmarkAnnotation.new(
      id: 'https://example.com/users/554433/texts/imscaliperimplguide/bookmarks/1',
      annotator: actor,
      annotated: Caliper::Entities::Resource::DigitalResource.new(
        id: 'https://example.com/#/texts/imscaliperimplguide/cfi/6/10!/4/2/2/2@0:0'
      ),
      bookmarkNotes: 'Caliper profiles model discrete learning activities or supporting activities that facilitate learning.',
      dateCreated: '2016-11-15T10:20:00.000Z'
    )
  end

  let(:epub_reader) do
    Caliper::Entities::Agent::SoftwareApplication.new(
      id: 'https://example.com/reader',
      name: 'ePub Reader',
      version: '1.2.3'
    )
  end

  let(:referrer) do
    Caliper::Entities::Reading::WebPage.new(
      id: 'https://example.edu/terms/201601/courses/7/sections/1/pages/1'
    )
  end

  let(:document_no_timestamps) do
    Caliper::Entities::Reading::Document.new(
      id: 'https://example.com/#/texts/imscaliperimplguide',
      name: 'IMS Caliper Implementation Guide',
      version: '1.1'
    )
  end

  let(:document_timestamps) do
    Caliper::Entities::Reading::Document.new(
      id: 'https://example.edu/etexts/201.epub',
      name: 'IMS Caliper Implementation Guide',
      version: '1.1',
      dateCreated: '2016-08-01T06:00:00.000Z',
      datePublished: '2016-10-01T06:00:00.000Z'
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
      organization: group,
      roles: [
        Caliper::Entities::LIS::Role::LEARNER
      ],
      status: Caliper::Entities::LIS::Status::ACTIVE,
      dateCreated: '2016-08-01T06:00:00.000Z'
    )
  end

  let(:session) do
    Caliper::Entities::Session::Session.new(
      id: 'https://example.com/sessions/1f6442a482de72ea6ad134943812bff564a76259',
      startedAtTime: '2016-11-15T10:00:00.000Z'
    )
  end

  it 'should ensure that a Caliper envelope containing a AssessmentEvent is correctly created and serialized' do
    navigation_event = Caliper::Events::NavigationEvent.new(
      action: Caliper::Actions::NAVIGATED_TO,
      actor: actor,
      edApp: epub_reader,
      eventTime: '2016-11-15T10:15:00.000Z',
      group: group,
      id: 'urn:uuid:72f66ce5-d2ec-44cc-bce5-41602e1015dc',
      membership: membership,
      object: web_page,
      referrer: referrer,
      session: session
    )

    annotation_event = Caliper::Events::AnnotationEvent.new(
      action: Caliper::Actions::BOOKMARKED,
      actor: actor,
      edApp: epub_reader,
      eventTime: '2016-11-15T10:20:00.000Z',
      generated: annotation,
      group: group,
      id: 'urn:uuid:c0afa013-64df-453f-b0a6-50f3efbe4cc0',
      membership: membership,
      object: document_no_timestamps,
      session: session
    )

    view_event = Caliper::Events::ViewEvent.new(
      action: Caliper::Actions::VIEWED,
      actor: actor,
      edApp: epub_reader,
      eventTime: '2016-11-15T10:21:00.000Z',
      group: group,
      id: 'urn:uuid:94bad4bd-a7b1-4c3e-ade4-2253efe65172',
      membership: membership,
      object: document_timestamps,
      session: session
    )

    # The Sensor
    options = Caliper::Options.new
    sensor = Caliper::Sensor.new('https://example.edu/sensors/1', options)
    requestor = Caliper::Request::HttpRequestor.new(options)
    json_payload = requestor.generate_payload(sensor,
      [
        navigation_event,
        annotation_event,
        view_event
      ],
      {optimize: {except: [:actor, :group, :object, :edApp, :membership, :session] }}
    )

    # Swap out sendTime=DateTime.now() in favor of fixture value (or test will most assuredly fail).
    json_payload.sub!(/\"sendTime\":\"[^\"]*\"/, '"sendTime": "2016-11-15T11:05:01.000Z"')

    # Load JSON from caliper-common-fixtures for comparison
    # NOTE - sym link to caliper-common-fixtures needs to exist under spec/fixtures
    json_string = File.read(File.join(FIXTURE_DIR, 'caliperEnvelopeEventBatch.json'))
    expect(json_payload).to be_json_eql(json_string)
  end
end
