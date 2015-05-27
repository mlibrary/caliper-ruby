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
require_all 'lib/caliper/entities/lis/role.rb'
require_all 'lib/caliper/entities/lis/status.rb'
require_all 'lib/caliper/entities/lis/course_section.rb'
require_all 'lib/caliper/entities/lis/course_offering.rb'
require_all 'lib/caliper/entities/lis/group.rb'
require_all 'lib/caliper/entities/assessment/assessment.rb'
require_all 'lib/caliper/entities/assessment/assessment_item.rb'
require_all 'lib/caliper/entities/assignable/attempt.rb'
require_all 'lib/caliper/entities/assignable/assignable_digital_resource.rb'
require_all 'lib/caliper/event/assessment_event.rb'
require_all 'lib/caliper/profiles/assessment_profile.rb'
require 'json_spec'

module Caliper
  module Event

    describe AssessmentEvent do

      it 'should ensure that a AssessmentEvent is correctly created and serialized' do

        # Actor
        actor = Caliper::Entities::Agent::Person.new
        actor.id = 'https://some-university.edu/user/554433'
        actor.dateCreated = '2015-08-01T06:00:00.000Z'
        actor.dateModified = '2015-09-02T11:30:00.000Z'

        # Action
        action = Caliper::Profiles::AssessmentActions::STARTED

        # Object
        assessment = Caliper::Entities::Assessment::Assessment.new
        assessment.id = "https://some-university.edu/politicalScience/2015/american-revolution-101/assessment1"
        assessment.name = "American Revolution - Key Figures Assessment"
        assessment.dateModified =  '2015-09-02T11:30:00.000Z'
        assessment.dateCreated =  '2015-08-01T06:00:00.000Z'
        assessment.datePublished =  '2015-08-15T09:30:00.000Z'
        assessment.version = "1.0"
        assessment.dateToActivate = '2015-08-16T05:00:00.000Z'
        assessment.dateToShow =  '2015-08-16T05:00:00.000Z'
        assessment.dateToStartOn = "2015-08-16T05:00:00.000Z"
        assessment.dateToSubmit = "2015-09-28T11:59:59.000Z"
        assessment.maxAttempts = 2
        assessment.maxSubmits = 2
        assessment.maxScore = 3.0

        # Generated attempt
        attempt = Caliper::Entities::Assignable::Attempt.new
        attempt.id = "https://some-university.edu/politicalScience/2015/american-revolution-101/assessment1/attempt1"
        attempt.actor = "https://some-university.edu/user/554433"
        attempt.assignable = "https://some-university.edu/politicalScience/2015/american-revolution-101/assessment1"
        attempt.dateCreated = "2015-08-01T06:00:00.000Z"
        attempt.dateModified = nil
        attempt.count = 1
        attempt.startedAtTime = "2015-09-15T10:15:00.000Z"
        attempt.duration = nil
        attempt.endedAtTime = nil
        attempt.extensions = {}
        attempt.name = nil

        # ed_app
        ed_app = Caliper::Entities::Agent::SoftwareApplication.new
        ed_app.id = 'https://com.sat/super-assessment-tool'
        ed_app.name = 'Super Assessment Tool'
        ed_app.dateCreated = '2015-08-01T06:00:00.000Z'
        ed_app.dateModified = nil

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

        membership = Caliper::Entities::LIS::Membership.new
        membership.id = "https://some-university.edu/politicalScience/2015/american-revolution-101/roster/554433"
        membership.name = "American Revolution 101"
        membership.description = "Roster entry"
        membership.member = "https://some-university.edu/user/554433"
        membership.organization = "https://some-university.edu/politicalScience/2015/american-revolution-101/section/001"
        membership.roles = [Caliper::Entities::LIS::Role::LEARNER]
        membership.status = Caliper::Entities::LIS::Status::ACTIVE
        membership.dateCreated = "2015-08-01T06:00:00.000Z"
        membership.dateModified = nil

        # Create the Event
        event = AssessmentEvent.new
        event.actor  = actor
        event.action = action
        event.object = assessment
        event.target = nil
        event.generated = attempt
        event.startedAtTime = '2015-09-15T10:15:00.000Z'
        event.endedAtTime = nil
        event.duration = nil
        event.edApp = ed_app
        event.group = group
        event.membership = membership
        event.federatedSession = nil
        # puts "Event JSON = #{event.to_json}'"

        # Load JSON from caliper-common-fixtures for comparison
        # NOTE - sym link to caliper-common-fixtures needs to exist under spec/fixtures
        file = File.read('spec/fixtures/caliperAssessmentEvent.json')
        data_hash = JSON.parse(file)
        expected_json = data_hash.to_json # convert hash back to JSON string after parse
        expect(event.to_json).to be_json_eql(expected_json)#.excluding("actor", "action", "object", "target", "generated", "ed_app", "group")

        # puts "JSON from file = #{data_hash}"
        deser_event = AssessmentEvent.new
        deser_event.from_json data_hash
        # puts "AssessmentEvent from JSON = #{deser_event.to_json}"

        # Ensure that the deserialized bookmark event object conforms
        expect(event).to eql(deser_event)
      end
    end
  end
end