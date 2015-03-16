require 'require_all'
require_all 'lib/caliper/entities/entity.rb'
require_all 'lib/caliper/entities/software_application.rb'
require_all 'lib/caliper/entities/lis/person.rb'
require_all 'lib/caliper/entities/lis/course_section.rb'
require_all 'lib/caliper/entities/reading/epub_volume.rb'
require_all 'lib/caliper/entities/reading/frame.rb'
require_all 'lib/caliper/event/session_event.rb'
require_all 'lib/caliper/profiles/session_profile.rb'

module Caliper
  module Event

    describe SessionEvent do

      it 'should ensure that a SessionEvent (login) is correctly created and serialized' do

        # The Actor (Person/Student))
        student = Caliper::Entities::LIS::Person.new
        student.id = 'https://some-university.edu/user/554433'
        student.dateCreated = '2015-01-01T06:00:00.000Z'
        student.dateModified = '2015-02-02T11:30:00.000Z'
        # puts "new student = #{student.to_json}"

        # The Action
        action = Caliper::Profiles::SessionActions::TIMEOUT

        # The Object (edApp)
        edApp = Caliper::Entities::SoftwareApplication.new
        edApp.id = 'https://github.com/readium/readium-js-viewer'
        edApp.name = 'Readium'
        edApp.dateCreated = '2015-01-01T06:00:00.000Z'
        edApp.dateModified = '2015-02-02T11:30:00.000Z'

        # The Target (Session)
        session = Caliper::Entities::Session.new
        session.id = 'https://github.com/readium/session-123456789'
        session.name = 'session-123456789'
        session.description = nil
        session.actor = student
        session.startedAtTime = '2015-02-15T10:15:00.000Z'
        session.endedAtTime = '2015-02-15T11:05:00.000Z'
        session.duration = 'PT3000S'
        session.dateCreated = '2015-01-01T06:00:00.000Z'
        session.dateModified = '2015-02-02T11:30:00.000Z'

        # The LIS Course Section for the Caliper Event
        course = Caliper::Entities::LIS::CourseSection.new
        course.id = 'https://some-university.edu/politicalScience/2014/american-revolution-101'
        course.name = 'American Revolution 101'
        course.dateCreated = '2015-01-01T06:00:00.000Z'
        course.dateModified = '2015-02-02T11:30:00.000Z'
        course.courseNumber = 'AmRev-101'
        course.label = 'Am Rev 101'
        course.semester = 'Spring-2014'

        # The (Session) Event
        session_event = SessionEvent.new
        session_event.actor  = edApp
        session_event.action = action
        session_event.object = edApp
        session_event.target = session
        session_event.generated = nil
        session_event.edApp  = edApp
        session_event.group = course
        session_event.startedAtTime = '2015-02-15T10:15:00.000Z'
        session_event.endedAtTime = '2015-02-15T11:05:00.000Z'
        session_event.duration = 'PT3000S'
        # puts "Event JSON = #{session_event.to_json}'"

        # Load JSON from caliper-common-fixtures for comparison
        # NOTE - sym link to caliper-common-fixtures needs to exist under spec/fixtures
        file = File.read('spec/fixtures/caliperSessionTimeoutEvent.json')
        data_hash = JSON.parse(file)
        expected_json = data_hash.to_json # convert hash back to JSON string after parse
        session_event.to_json.should be_json_eql(expected_json)#.excluding("@class")

        # puts "JSON from file = #{data_hash}"
        deser_session_event = SessionEvent.new
        deser_session_event.from_json data_hash
        # puts "SessionEvent from JSON = #{deser_session_event.to_json}"

        # Ensure that the deserialized session event object conforms
        expect(session_event).to eql(deser_session_event)

      end

    end
  end
end
