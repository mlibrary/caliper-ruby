require 'require_all'
require_all 'lib/caliper/entities/entity.rb'
require_all 'lib/caliper/entities/software_application.rb'
require_all 'lib/caliper/entities/lis/person.rb'
require_all 'lib/caliper/entities/lis/course_section.rb'
require_all 'lib/caliper/entities/reading/epub_volume.rb'
require_all 'lib/caliper/entities/annotation/tag_annotation.rb'
require_all 'lib/caliper/event/annotation_event.rb'
require_all 'lib/caliper/profiles/annotation_profile.rb'

module Caliper
  module Event

    describe AnnotationEvent do

      it 'should ensure that a AnnotationEvent (Tagged) is correctly created and serialized' do

        # The Actor (Person/Student))
        student = Caliper::Entities::LIS::Person.new
        student.id = 'https://some-university.edu/user/554433'
        student.dateCreated = '2015-01-01T06:00:00.000Z'
        student.dateModified = '2015-02-02T11:30:00.000Z'
        # puts "new student = #{student.to_json}"

        # The Action
        action = Caliper::Profiles::AnnotationActions::TAGGED

        # The Object of the tag (Frame)
        ePubVolume = Caliper::Entities::Reading::EPubVolume.new
        ePubVolume.id = 'https://github.com/readium/readium-js-viewer/book/34843#epubcfi(/4/3)'
        ePubVolume.name = 'The Glorious Cause: The American Revolution, 1763-1789 (Oxford History of the United States)'
        ePubVolume.version = '2nd ed.'
        ePubVolume.dateCreated = '2015-01-01T06:00:00.000Z'
        ePubVolume.dateModified = '2015-02-02T11:30:00.000Z'

        frame = Caliper::Entities::Reading::Frame.new
        frame.id = 'https://github.com/readium/readium-js-viewer/book/34843#epubcfi(/4/3/4)'
        frame.name = 'The Stamp Act Crisis'
        frame.version = '2nd ed.'
        frame.dateCreated = '2015-01-01T06:00:00.000Z'
        frame.dateModified = '2015-02-02T11:30:00.000Z'
        frame.index = 4
        frame.isPartOf = ePubVolume

        # The Generated (Annotation::BookmarkAnnotation)
        tag = Caliper::Entities::Annotation::TagAnnotation.new
        tag.id = 'https://someEduApp.edu/tags/7654'
        tag.name = nil
        tag.description = nil
        tag.dateCreated = '2015-01-01T06:00:00.000Z'
        tag.dateModified = '2015-02-02T11:30:00.000Z'
        tag.annotatedId = 'https://github.com/readium/readium-js-viewer/book/34843#epubcfi(/4/3/4)'
        tag.tags = ["to-read", "1765", "shared-with-project-team"]

        # The course that is part of the Learning Context (edApp)
        edApp = Caliper::Entities::SoftwareApplication.new
        edApp.id = 'https://github.com/readium/readium-js-viewer'
        edApp.name = 'Readium'
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

        # The (Annotation::BookmarkAnnotation) Event
        annotation_event = AnnotationEvent.new
        annotation_event.actor  = student
        annotation_event.action = action
        annotation_event.object = frame
        annotation_event.target = nil
        annotation_event.generated = tag
        annotation_event.edApp  = edApp
        annotation_event.group = course
        annotation_event.startedAtTime = '2015-02-15T10:15:00.000Z'
        annotation_event.endedAtTime = nil
        annotation_event.duration = nil
        # puts "Event JSON = #{annotation_event.to_json}'"

        # Load JSON from caliper-common-fixtures for comparison
        # NOTE - sym link to caliper-common-fixtures needs to exist under spec/fixtures
        file = File.read('spec/fixtures/caliperTagAnnotationEvent.json')
        data_hash = JSON.parse(file)
        expected_json = data_hash.to_json # convert hash back to JSON string after parse
        annotation_event.to_json.should be_json_eql(expected_json)#.excluding("@class")

        # puts "JSON from file = #{data_hash}"
        deser_annotation_event = AnnotationEvent.new
        deser_annotation_event.from_json data_hash
        # puts "AnnotationEvent from JSON = #{deser_annotation_event.to_json}"

        # Ensure that the deserialized tag event object conforms
        expect(annotation_event).to eql(deser_annotation_event)

      end

    end
  end
end
