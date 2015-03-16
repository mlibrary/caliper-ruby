require 'require_all'
require_all 'lib/caliper/entities/entity.rb'
require_all 'lib/caliper/entities/software_application.rb'
require_all 'lib/caliper/entities/session.rb'
require_all 'lib/caliper/entities/lis/person.rb'
require_all 'lib/caliper/entities/lis/course_section.rb'
require_all 'lib/caliper/entities/reading/epub_volume.rb'
require_all 'lib/caliper/entities/reading/frame.rb'
require_all 'lib/caliper/event/session_event.rb'
require_all 'lib/caliper/profiles/session_profile.rb'

module Helper

  def session_event

    # The Actor (Person/Student))
    student = Caliper::Entities::LIS::Person.new
    student.id = 'https://some-university.edu/user/554433'
    student.dateCreated = '2015-01-01T06:00:00.000Z'
    student.dateModified = '2015-02-02T11:30:00.000Z'
    # puts "new student = #{student.to_json}"

    # The Action
    action = Caliper::Profiles::SessionActions::LOGGED_IN;

    # The Object (edApp)
    edApp = Caliper::Entities::SoftwareApplication.new
    edApp.id = 'https://github.com/readium/readium-js-viewer'
    edApp.name = 'Readium'
    edApp.dateCreated = '2015-01-01T06:00:00.000Z'
    edApp.dateModified = '2015-02-02T11:30:00.000Z'

    # The Target (Frame)
    ePubVolume = Caliper::Entities::Reading::EPubVolume.new
    ePubVolume.id = 'https://github.com/readium/readium-js-viewer/book/34843#epubcfi(/4/3)'
    ePubVolume.name = 'The Glorious Cause: The American Revolution, 1763-1789 (Oxford History of the United States)'
    ePubVolume.version = '2nd ed.'
    ePubVolume.dateCreated = '2015-01-01T06:00:00.000Z'
    ePubVolume.dateModified = '2015-02-02T11:30:00.000Z'

    frame = Caliper::Entities::Reading::Frame.new
    frame.id = 'https://github.com/readium/readium-js-viewer/book/34843#epubcfi(/4/3/1)'
    frame.name = 'Key Figures: George Washington'
    frame.version = '2nd ed.'
    frame.dateCreated = '2015-01-01T06:00:00.000Z'
    frame.dateModified = '2015-02-02T11:30:00.000Z'
    frame.index = 1
    frame.isPartOf = ePubVolume

    # The Generated (Session)
    session = Caliper::Entities::Session.new
    session.id = 'https://github.com/readium/session-123456789'
    session.name = 'session-123456789'
    session.description = nil
    session.actor = student
    session.startedAtTime = '2015-02-15T10:15:00.000Z'
    session.endedAtTime = nil
    session.duration = nil
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
    session_event = Caliper::Event::SessionEvent.new
    session_event.actor  = student
    session_event.action = action
    session_event.object = edApp
    session_event.target = frame
    session_event.generated = session
    session_event.edApp  = edApp
    session_event.group = course
    session_event.startedAtTime = '2015-02-15T10:15:00.000Z'
    return session_event

  end
end
