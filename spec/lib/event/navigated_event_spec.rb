require 'require_all'
require_all 'lib/caliper/entities/entity.rb'
require_all 'lib/caliper/entities/web_page.rb'
require_all 'lib/caliper/entities/software_application.rb'
require_all 'lib/caliper/entities/lis/person.rb'
require_all 'lib/caliper/entities/lis/course_section.rb'
require_all 'lib/caliper/entities/reading/epub_volume.rb'
require_all 'lib/caliper/event/navigation_event.rb'
require_all 'lib/caliper/profiles/reading_profile.rb'
require 'json_spec'

module Caliper
  module Event

    describe NavigationEvent do

      it 'should ensure that a Navigation Event is correctly created and serialized' do

        # The Actor (Person/Student))
        student = Caliper::Entities::LIS::Person.new
        student.id = 'https://some-university.edu/user/554433'
        student.dateCreated = '2015-08-01T06:00:00.000Z'
        student.dateModified = '2015-09-02T11:30:00.000Z'
        # puts "new student = #{student.to_json}"

        # The Action
        action = Caliper::Profiles::ReadingActions::NAVIGATED_TO

        # The Object navigated (ePub Volume)
        ePubVolume = Caliper::Entities::Reading::EPubVolume.new
        ePubVolume.id = 'https://github.com/readium/readium-js-viewer/book/34843#epubcfi(/4/3)'
        ePubVolume.name = 'The Glorious Cause: The American Revolution, 1763-1789 (Oxford History of the United States)'
        ePubVolume.version = '2nd ed.'
        ePubVolume.dateCreated = '2015-08-01T06:00:00.000Z'
        ePubVolume.dateModified = '2015-09-02T11:30:00.000Z'

        # The Target within the Object (frame)
        frame = Caliper::Entities::Reading::Frame.new
        frame.id = 'https://github.com/readium/readium-js-viewer/book/34843#epubcfi(/4/3/1)'
        frame.name = 'Key Figures: George Washington'
        frame.version = '2nd ed.'
        frame.dateCreated = '2015-08-01T06:00:00.000Z'
        frame.dateModified = '2015-09-02T11:30:00.000Z'
        frame.index = 1
        frame.isPartOf = ePubVolume

        # The course that is part of the Learning Context (edApp)
        edApp = Caliper::Entities::SoftwareApplication.new
        edApp.id = 'https://github.com/readium/readium-js-viewer'
        edApp.name = 'Readium'
        edApp.dateCreated = '2015-08-01T06:00:00.000Z'
        edApp.dateModified = '2015-09-02T11:30:00.000Z'

        # The LIS Course Section for the Caliper Event
        course = Caliper::Entities::LIS::CourseSection.new
        course.id = 'https://some-university.edu/politicalScience/2014/american-revolution-101'
        course.name = 'American Revolution 101'
        course.dateCreated = '2015-08-01T06:00:00.000Z'
        course.dateModified = '2015-09-02T11:30:00.000Z'
        course.courseNumber = 'AmRev-101'
        course.label = 'Am Rev 101'
        course.semester = 'Spring-2014'

        # The navigatedFrom property (specific to Navigation Event)
        fromPage = Caliper::Entities::WebPage.new
        fromPage.id = 'https://some-university.edu/politicalScience/2014/american-revolution-101/index.html'
        fromPage.name = 'American Revolution 101 Landing Page'
        fromPage.dateCreated = '2015-08-01T06:00:00.000Z'
        fromPage.dateModified = '2015-09-02T11:30:00.000Z'
        fromPage.isPartOf = course
        fromPage.version = '1.0'

        # The (Reading::BookmarkReading) Event
        navigated_event = Caliper::Event::NavigationEvent.new
        navigated_event.actor  = student
        navigated_event.action = action
        navigated_event.object = ePubVolume
        navigated_event.target = frame
        navigated_event.generated = nil
        navigated_event.edApp  = edApp
        navigated_event.group = course
        navigated_event.navigatedFrom = fromPage
        navigated_event.startedAtTime = '2015-09-15T10:15:00.000Z'
        navigated_event.endedAtTime = nil
        navigated_event.duration = nil
        # puts "Event JSON = #{navigated_event.to_json}'"

        # Load JSON from caliper-common-fixtures for comparison
        # NOTE - sym link to caliper-common-fixtures needs to exist under spec/fixtures
        file = File.read('spec/fixtures/caliperNavigationEvent.json')
        data_hash = JSON.parse(file)
        expected_json = data_hash.to_json # convert hash back to JSON string after parse
        navigated_event.to_json.should be_json_eql(expected_json)#.excluding("actor", "action", "object", "target", "generated", "edApp", "group")

        # puts "JSON from file = #{data_hash}"
        deser_navigated_event = Caliper::Event::NavigationEvent.new
        deser_navigated_event.from_json data_hash
        # puts "ReadingEvent from JSON = #{deser_navigated_event.to_json}"

        # Ensure that the deserialized shared event object conforms
        expect(navigated_event).to eql(deser_navigated_event)

      end

    end
  end
end
