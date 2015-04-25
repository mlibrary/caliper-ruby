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
require_all 'lib/caliper/entities/lis/roles.rb'
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

        # The Actor (Person/Student))
        student = Caliper::Entities::Agent::Person.new
        student.id = 'https://some-university.edu/user/554433'
        membership1 = Caliper::Entities::LIS::Membership.new
        membership1.id = "https://some-university.edu/membership/001"
        membership1.member = "https://some-university.edu/user/554433"
        membership1.organization = "https://some-university.edu/politicalScience/2015/american-revolution-101"
        membership1.roles = [Caliper::Entities::LIS::Roles::LEARNER]
        membership1.status = Caliper::Entities::LIS::Status::ACTIVE
        membership1.dateCreated = "2015-08-01T06:00:00.000Z"
        membership1.dateModified = nil;
        membership2 = Caliper::Entities::LIS::Membership.new
        membership2.id = "https://some-university.edu/membership/002"
        membership2.member = "https://some-university.edu/user/554433"
        membership2.organization = "https://some-university.edu/politicalScience/2015/american-revolution-101/section/001"
        membership2.roles = [Caliper::Entities::LIS::Roles::LEARNER]
        membership2.status = Caliper::Entities::LIS::Status::ACTIVE
        membership2.dateCreated = "2015-08-01T06:00:00.000Z"
        membership2.dateModified = nil
        membership3 = Caliper::Entities::LIS::Membership.new
        membership3.id = "https://some-university.edu/membership/003"
        membership3.member = "https://some-university.edu/user/554433"
        membership3.organization = "https://some-university.edu/politicalScience/2015/american-revolution-101/section/001/group/001"
        membership3.roles = [Caliper::Entities::LIS::Roles::LEARNER]
        membership3.status = Caliper::Entities::LIS::Status::ACTIVE
        membership3.dateCreated = "2015-08-01T06:00:00.000Z"
        membership3.dateModified = nil
        student.hasMembership = [membership1, membership2, membership3]
        student.dateCreated = '2015-08-01T06:00:00.000Z'
        student.dateModified = '2015-09-02T11:30:00.000Z'
        # puts "new student = #{student.to_json}"

        # The Action
        action = Caliper::Profiles::MediaActions::PAUSED

        # The Object viewed (Video)
        video = Caliper::Entities::Media::VideoObject.new
        video.id = 'https://com.sat/super-media-tool/video/video1'
        video.name = 'American Revolution - Key Figures Video'
        video.version = '1.0'
        video.duration = 1420
        video.dateCreated = '2015-08-01T06:00:00.000Z'
        video.dateModified = '2015-09-02T11:30:00.000Z'

        learnObjective = Caliper::Entities::LearningObjective.new
        learnObjective.id = 'http://americanrevolution.com/personalities/learn'
        learnObjective.dateCreated = '2015-08-01T06:00:00.000Z'
        learnObjective.dateModified = nil
        video.alignedLearningObjective = [learnObjective]

        # The Target within the Object (MediaLocation)
        videoLocation = Caliper::Entities::Media::MediaLocation.new
        videoLocation.id = 'https://com.sat/super-media-tool/video/video1'
        videoLocation.version = '1.0'
        videoLocation.dateCreated = '2015-08-01T06:00:00.000Z'
        videoLocation.dateModified = nil
        videoLocation.currentTime = 710

        # The course that is part of the Learning Context (edApp)
        edApp = Caliper::Entities::Agent::SoftwareApplication.new
        edApp.id = 'https://com.sat/super-media-tool'
        edApp.name = 'Super Media Tool'
        edApp.hasMembership = []
        edApp.dateCreated = '2015-08-01T06:00:00.000Z'
        edApp.dateModified = '2015-09-02T11:30:00.000Z'

        #LIS Course Offering
        courseOffering = Caliper::Entities::LIS::CourseOffering.new
        courseOffering.id = "https://some-university.edu/politicalScience/2015/american-revolution-101"
        courseOffering.name = "Political Science 101: The American Revolution"
        courseOffering.courseNumber = "POL101"
        courseOffering.academicSession = "Fall-2015"
        courseOffering.membership = []
        courseOffering.subOrganizationOf = nil
        courseOffering.dateCreated = '2015-08-01T06:00:00.000Z'
        courseOffering.dateModified = '2015-09-02T11:30:00.000Z'
        
        # The LIS Course Section for the Caliper Event
        course = Caliper::Entities::LIS::CourseSection.new
        course.id = 'https://some-university.edu/politicalScience/2015/american-revolution-101/section/001'
        course.name = 'American Revolution 101'
        course.courseNumber = "POL101"
        course.academicSession = "Fall-2015"
        course.category = nil
        course.membership = [membership2]
        course.subOrganizationOf = courseOffering
        course.dateCreated = '2015-08-01T06:00:00.000Z'
        course.dateModified = '2015-09-02T11:30:00.000Z'

        # LIS Group
        group = Caliper::Entities::LIS::Group.new
        group.id = "https://some-university.edu/politicalScience/2015/american-revolution-101/section/001/group/001"
        group.name = "Discussion Group 001"
        group.membership = [membership3]
        group.subOrganizationOf = course
        group.dateCreated = '2015-08-01T06:00:00.000Z'
        group.dateModified = nil

        # The (Reading::BookmarkReading) Event
        media_event = Caliper::Event::MediaEvent.new
        media_event.actor  = student
        media_event.action = action
        media_event.object = video
        media_event.target = videoLocation
        media_event.generated = nil
        media_event.edApp  = edApp
        media_event.group = group
        media_event.startedAtTime = '2015-09-15T10:15:00.000Z'
        media_event.endedAtTime = nil
        media_event.duration = nil
        # puts "Event JSON = #{media_event.to_json}'"

        # Load JSON from caliper-common-fixtures for comparison
        # NOTE - sym link to caliper-common-fixtures needs to exist under spec/fixtures
        file = File.read('spec/fixtures/caliperMediaEvent.json')
        data_hash = JSON.parse(file)
        expected_json = data_hash.to_json # convert hash back to JSON string after parse
        media_event.to_json.should be_json_eql(expected_json)#.excluding("actor", "action", "object", "target", "generated", "edApp", "group")

        # puts "JSON from file = #{data_hash}"
        deser_media_event = Caliper::Event::MediaEvent.new
        deser_media_event.from_json data_hash
        # puts "ReadingEvent from JSON = #{deser_media_event.to_json}"

        # Ensure that the deserialized shared event object conforms
        expect(media_event).to eql(deser_media_event)
      end
    end
  end
end
