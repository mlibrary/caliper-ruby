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
require_all 'lib/caliper/entities/learning_objective.rb'
require_all 'lib/caliper/entities/agent/person.rb'
require_all 'lib/caliper/entities/lis/membership.rb'
require_all 'lib/caliper/entities/lis/role.rb'
require_all 'lib/caliper/entities/lis/status.rb'
require_all 'lib/caliper/entities/lis/course_section.rb'
require_all 'lib/caliper/entities/lis/course_offering.rb'
require_all 'lib/caliper/entities/lis/group.rb'
require_all 'lib/caliper/entities/media/media_object.rb'
require_all 'lib/caliper/entities/media/video_object.rb'
require_all 'lib/caliper/entities/media/media_location.rb'
require_all 'lib/caliper/event/media_event.rb'
require_all 'lib/caliper/profiles/media_profile.rb'
require 'json_spec'

module Caliper
  module Event

    describe MediaEvent do

      it 'should ensure that a Paused Video MediaObjectEvent is correctly created and serialized' do

        # Actor
        actor = Caliper::Entities::Agent::Person.new
        actor.id = 'https://some-university.edu/user/554433'
        actor.dateCreated = '2015-08-01T06:00:00.000Z'
        actor.dateModified = '2015-09-02T11:30:00.000Z'

        # Action
        action = Caliper::Profiles::MediaActions::PAUSED

        # Learning Objective (video.alignedLearningObjective)
        learnObjective = Caliper::Entities::LearningObjective.new
        learnObjective.id = 'http://americanrevolution.com/personalities/learn'
        learnObjective.dateCreated = '2015-08-01T06:00:00.000Z'
        learnObjective.dateModified = nil

        # Object
        video = Caliper::Entities::Media::VideoObject.new
        video.id = 'https://com.sat/super-media-tool/video/video1'
        video.name = 'American Revolution - Key Figures Video'
        video.version = '1.0'
        video.duration = 1420
        video.dateCreated = '2015-08-01T06:00:00.000Z'
        video.dateModified = '2015-09-02T11:30:00.000Z'
        video.alignedLearningObjective = [learnObjective]

        # Target coordinates
        target = Caliper::Entities::Media::MediaLocation.new
        target.id = 'https://com.sat/super-media-tool/video/video1'
        target.version = '1.0'
        target.dateCreated = '2015-08-01T06:00:00.000Z'
        target.dateModified = nil
        target.currentTime = 710

        # ed_app
        ed_app = Caliper::Entities::Agent::SoftwareApplication.new
        ed_app.id = 'https://com.sat/super-media-tool'
        ed_app.name = 'Super Media Tool'
        ed_app.dateCreated = '2015-08-01T06:00:00.000Z'
        ed_app.dateModified = '2015-09-02T11:30:00.000Z'

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
        event = Caliper::Event::MediaEvent.new
        event.actor  = actor
        event.action = action
        event.object = video
        event.target = target
        event.generated = nil
        event.startedAtTime = '2015-09-15T10:15:00.000Z'
        event.endedAtTime = nil
        event.duration = nil
        event.edApp = ed_app
        event.group = group
        event.membership = membership
        # puts "Event JSON = #{event.to_json}'"

        # Load JSON from caliper-common-fixtures for comparison
        # NOTE - sym link to caliper-common-fixtures needs to exist under spec/fixtures
        file = File.read('spec/fixtures/caliperMediaEvent.json')
        data_hash = JSON.parse(file)
        expected_json = data_hash.to_json # convert hash back to JSON string after parse
        expect(event.to_json).to be_json_eql(expected_json)#.excluding("actor", "action", "object", "target", "generated", "ed_app", "group")

        # puts "JSON from file = #{data_hash}"
        deser_event = Caliper::Event::MediaEvent.new
        deser_event.from_json data_hash
        # puts "ReadingEvent from JSON = #{deser_event.to_json}"

        # Ensure that the deserialized shared event object conforms
        expect(event).to eql(deser_event)
      end
    end
  end
end
