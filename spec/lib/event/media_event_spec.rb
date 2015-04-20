require 'require_all'
require_all 'lib/caliper/entities/entity.rb'
require_all 'lib/caliper/entities/software_application.rb'
require_all 'lib/caliper/entities/lis/person.rb'
require_all 'lib/caliper/entities/lis/course_section.rb'
require_all 'lib/caliper/entities/media/media_object.rb'
require_all 'lib/caliper/entities/media/video_object.rb'
require_all 'lib/caliper/entities/media/media_location.rb'
require_all 'lib/caliper/event/media_event.rb'
require_all 'lib/caliper/profiles/media_profile.rb'
require 'json_spec'

module Caliper
  module Event

    describe MediaEvent do

      it 'should ensure that a Media Event (Video Paused) is correctly created and serialized' do

        # The Actor (Person/Student))
        student = Caliper::Entities::LIS::Person.new
        student.id = 'https://some-university.edu/user/554433'
        student.dateCreated = '2015-01-01T06:00:00.000Z'
        student.dateModified = '2015-02-02T11:30:00.000Z'
        # puts "new student = #{student.to_json}"

        # The Action
        action = Caliper::Profiles::MediaActions::PAUSED

        # The Object viewed (Video)
        video = Caliper::Entities::Media::VideoObject.new
        video.id = 'https://com.sat/super-media-tool/video/video1'
        video.name = 'American Revolution - Key Figures Video'
        video.version = '1.0'
        video.duration = 1420
        video.dateCreated = '2015-01-01T06:00:00.000Z'
        video.dateModified = '2015-02-02T11:30:00.000Z'

        learnObjective = Caliper::Entities::LearningObjective.new
        learnObjective.id = 'http://americanrevolution.com/personalities/learn'
        learnObjective.dateCreated = '2015-01-01T06:00:00.000Z'
        learnObjective.dateModified = nil
        video.alignedLearningObjective = [learnObjective]

        # The Target within the Object (MediaLocation)
        videoLocation = Caliper::Entities::Media::MediaLocation.new
        videoLocation.id = 'https://com.sat/super-media-tool/video/video1'
        videoLocation.version = '1.0'
        videoLocation.dateCreated = '2015-01-01T06:00:00.000Z'
        videoLocation.dateModified = nil
        videoLocation.currentTime = 710

        # The course that is part of the Learning Context (edApp)
        edApp = Caliper::Entities::SoftwareApplication.new
        edApp.id = 'https://com.sat/super-media-tool'
        edApp.name = 'Super Media Tool'
        edApp.dateCreated = '2015-01-01T06:00:00.000Z'
        edApp.dateModified = '2015-02-02T11:30:00.000Z'

        # The LIS Course Section for the Caliper Event
        course = Caliper::Entities::LIS::CourseSection.new
        course.id = 'https://some-university.edu/politicalScience/2014/american-revolution-101'
        course.name = 'American Revolution 101'
        course.dateCreated = '2015-01-01T06:00:00.000Z'
        course.dateModified = '2015-02-02T11:30:00.000Z'
        course.courseNumber = 'AmRev-101'
        course.label = 'Am Rev 101'
        course.semester = 'Spring-2014'

        # The (Reading::BookmarkReading) Event
        media_event = Caliper::Event::MediaEvent.new
        media_event.actor  = student
        media_event.action = action
        media_event.object = video
        media_event.target = videoLocation
        media_event.generated = nil
        media_event.edApp  = edApp
        media_event.group = course
        media_event.startedAtTime = '2015-02-15T10:15:00.000Z'
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
