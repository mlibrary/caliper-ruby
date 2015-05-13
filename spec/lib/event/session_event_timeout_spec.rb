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
require_all 'lib/caliper/entities/entity.rb'
require_all 'lib/caliper/entities/agent/software_application.rb'
require_all 'lib/caliper/entities/agent/person.rb'
require_all 'lib/caliper/entities/lis/membership.rb'
require_all 'lib/caliper/entities/lis/roles.rb'
require_all 'lib/caliper/entities/lis/status.rb'
require_all 'lib/caliper/entities/lis/course_section.rb'
require_all 'lib/caliper/entities/lis/course_offering.rb'
require_all 'lib/caliper/entities/lis/group.rb'
require_all 'lib/caliper/entities/session/session.rb'
require_all 'lib/caliper/event/session_event.rb'
require_all 'lib/caliper/profiles/session_profile.rb'
require 'json_spec'

module Caliper
  module Event

    describe SessionEvent do

      it 'should ensure that a TimedOut SessionEvent is correctly created and serialized' do

        # EdApp
        ed_app = Caliper::Entities::Agent::SoftwareApplication.new
        ed_app.id = 'https://github.com/readium/readium-js-viewer'
        ed_app.name = 'Readium'
        ed_app.roles = []
        ed_app.dateCreated = '2015-08-01T06:00:00.000Z'
        ed_app.dateModified = '2015-09-02T11:30:00.000Z'

        # Actor (edApp)
        actor = ed_app

        # Action
        action = Caliper::Profiles::SessionActions::TIMED_OUT

        # Object (edApp)
        obj = ed_app

        # Target session actor (session.actor)
        student = Caliper::Entities::Agent::Person.new
        student.id = 'https://some-university.edu/user/554433'
        student.roles = [Caliper::Entities::LIS::Roles::LEARNER]
        student.dateCreated = '2015-08-01T06:00:00.000Z'
        student.dateModified = '2015-09-02T11:30:00.000Z'

        # Target session
        session = Caliper::Entities::Session::Session.new
        session.id = 'https://github.com/readium/session-123456789'
        session.name = 'session-123456789'
        session.description = nil
        session.actor = student
        session.startedAtTime = '2015-09-15T10:15:00.000Z'
        session.endedAtTime = '2015-09-15T11:05:00.000Z'
        session.duration = 'PT3000S'
        session.dateCreated = '2015-08-01T06:00:00.000Z'
        session.dateModified = '2015-09-02T11:30:00.000Z'

        # LIS Course Offering
        course = Caliper::Entities::LIS::CourseOffering.new
        course.id = "https://some-university.edu/politicalScience/2015/american-revolution-101"
        course.name = "Political Science 101: The American Revolution"
        course.courseNumber = "POL101"
        course.academicSession = "Fall-2015"
        course.subOrganizationOf = nil
        course.dateCreated = '2015-08-01T06:00:00.000Z'
        course.dateModified = '2015-09-02T11:30:00.000Z'

        # LIS Course Section
        section = Caliper::Entities::LIS::CourseSection.new
        section.id = 'https://some-university.edu/politicalScience/2015/american-revolution-101/section/001'
        section.name = 'American Revolution 101'
        section.courseNumber = "POL101"
        section.academicSession = "Fall-2015"
        section.category = nil
        section.subOrganizationOf = course
        section.dateCreated = '2015-08-01T06:00:00.000Z'
        section.dateModified = '2015-09-02T11:30:00.000Z'

        # LIS Group
        group = Caliper::Entities::LIS::Group.new
        group.id = "https://some-university.edu/politicalScience/2015/american-revolution-101/section/001/group/001"
        group.name = "Discussion Group 001"
        group.subOrganizationOf = section
        group.dateCreated = '2015-08-01T06:00:00.000Z'
        group.dateModified = nil

        # Create the Event
        event = SessionEvent.new
        event.actor  = ed_app
        event.action = action
        event.object = obj
        event.target = session
        event.generated = nil
        event.edApp  = ed_app
        event.group = group
        event.startedAtTime = '2015-09-15T10:15:00.000Z'
        event.endedAtTime = '2015-09-15T11:05:00.000Z'
        event.duration = 'PT3000S'
        # puts "Event JSON = #{event.to_json}'"

        # Load JSON from caliper-common-fixtures for comparison
        # NOTE - sym link to caliper-common-fixtures needs to exist under spec/fixtures
        file = File.read('spec/fixtures/caliperSessionTimeoutEvent.json')
        data_hash = JSON.parse(file)
        expected_json = data_hash.to_json # convert hash back to JSON string after parse
        expect(event.to_json).to be_json_eql(expected_json)#.excluding("actor", "action", "object", "target", "generated", "edApp", "group")

        # puts "JSON from file = #{data_hash}"
        deser_event = SessionEvent.new
        deser_event.from_json data_hash
        # puts "SessionEvent from JSON = #{deser_event.to_json}"

        # Ensure that the deserialized session event object conforms
        expect(event).to eql(deser_event)
      end
    end
  end
end