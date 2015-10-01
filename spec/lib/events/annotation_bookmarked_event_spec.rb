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
require_all 'lib/caliper/actions/annotation_actions.rb'
require_all 'lib/caliper/entities/entity_base.rb'
require_all 'lib/caliper/entities/agent/software_application.rb'
require_all 'lib/caliper/entities/agent/person.rb'
require_all 'lib/caliper/entities/lis/membership.rb'
require_all 'lib/caliper/entities/lis/role.rb'
require_all 'lib/caliper/entities/lis/status.rb'
require_all 'lib/caliper/entities/lis/course_section.rb'
require_all 'lib/caliper/entities/lis/course_offering.rb'
require_all 'lib/caliper/entities/lis/group.rb'
require_all 'lib/caliper/entities/reading/epub_volume.rb'
require_all 'lib/caliper/entities/annotation/bookmark_annotation.rb'
require_all 'lib/caliper/events/annotation_event.rb'
require 'json_spec'

module Caliper
  module Events

    describe AnnotationEvent do

      it 'should ensure that a Bookmarked AnnotationEvent is correctly created and serialized' do

        # Actor
        actor = Caliper::Entities::Agent::Person.new
        actor.id = 'https://example.edu/user/554433'
        actor.dateCreated = Time.utc(2015,8,1,6,0,0).iso8601(3)
        actor.dateModified = Time.utc(2015,9,2,11,30,0).iso8601(3)

        # Action
        action = Caliper::Actions::AnnotationActions::BOOKMARKED

        # ePub parent volume
        ePub = Caliper::Entities::Reading::EPubVolume.new
        ePub.id = 'https://example.com/viewer/book/34843#epubcfi(/4/3)'
        ePub.name = 'The Glorious Cause: The American Revolution, 1763-1789 (Oxford History of the United States)'
        ePub.version = '2nd ed.'
        ePub.dateCreated = Time.utc(2015,8,1,6,0,0).iso8601(3)
        ePub.dateModified = Time.utc(2015,9,2,11,30,0).iso8601(3)

        # Object
        obj = Caliper::Entities::Reading::Frame.new
        obj.id = 'https://example.com/viewer/book/34843#epubcfi(/4/3/2)'
        obj.name = 'Key Figures: Lord North'
        obj.isPartOf = ePub
        obj.version = ePub.version
        obj.index = 2
        obj.dateCreated = Time.utc(2015,8,1,6,0,0).iso8601(3)
        obj.dateModified = Time.utc(2015,9,2,11,30,0).iso8601(3)

        # Generated annotation
        bookmark = Caliper::Entities::Annotation::BookmarkAnnotation.new
        bookmark.id = 'https://example.edu/bookmarks/00001'
        bookmark.dateCreated = Time.utc(2015,8,1,6,0,0).iso8601(3)
        bookmark.dateModified = Time.utc(2015,9,2,11,30,0).iso8601(3)
        bookmark.annotated = 'https://example.com/viewer/book/34843#epubcfi(/4/3/2)'
        bookmark.bookmarkNotes = 'The Intolerable Acts (1774)--bad idea Lord North'

        # ePub app
        ed_app = Caliper::Entities::Agent::SoftwareApplication.new
        ed_app.id = 'https://example.com/viewer'
        ed_app.name = 'ePub'
        ed_app.dateCreated = Time.utc(2015,8,1,6,0,0).iso8601(3)
        ed_app.dateModified = Time.utc(2015,9,2,11,30,0).iso8601(3)

        # LIS Course Offering
        course = Caliper::Entities::LIS::CourseOffering.new
        course.id = "https://example.edu/politicalScience/2015/american-revolution-101"
        course.name = "Political Science 101: The American Revolution"
        course.courseNumber = "POL101"
        course.academicSession = "Fall-2015"
        course.dateCreated = Time.utc(2015,8,1,6,0,0).iso8601(3)
        course.dateModified = Time.utc(2015,9,2,11,30,0).iso8601(3)
        
        # LIS Course Section
        section = Caliper::Entities::LIS::CourseSection.new
        section.id = 'https://example.edu/politicalScience/2015/american-revolution-101/section/001'
        section.name = 'American Revolution 101'
        section.courseNumber = "POL101"
        section.academicSession = "Fall-2015"
        section.subOrganizationOf = course
        section.dateCreated = Time.utc(2015,8,1,6,0,0).iso8601(3)
        section.dateModified = Time.utc(2015,9,2,11,30,0).iso8601(3)

        # LIS Group
        group = Caliper::Entities::LIS::Group.new
        group.id = "https://example.edu/politicalScience/2015/american-revolution-101/section/001/group/001"
        group.name = "Discussion Group 001"
        group.subOrganizationOf = section
        group.dateCreated = Time.utc(2015,8,1,6,0,0).iso8601(3)

        membership = Caliper::Entities::LIS::Membership.new
        membership.id = "https://example.edu/politicalScience/2015/american-revolution-101/roster/554433"
        membership.name = "American Revolution 101"
        membership.description = "Roster entry"
        membership.member = "https://example.edu/user/554433"
        membership.organization = "https://example.edu/politicalScience/2015/american-revolution-101/section/001"
        membership.roles = [Caliper::Entities::LIS::Role::LEARNER]
        membership.status = Caliper::Entities::LIS::Status::ACTIVE
        membership.dateCreated = Time.utc(2015,8,1,6,0,0).iso8601(3)

        # Create the Event
        event = AnnotationEvent.new
        event.actor  = actor
        event.action = action
        event.object = obj
        event.generated = bookmark
        event.eventTime = Time.utc(2015,9,15,10,15,0).iso8601(3)
        event.edApp = ed_app
        event.group = group
        event.membership = membership

        # Load JSON from caliper-common-fixtures for comparison
        # NOTE - sym link to caliper-common-fixtures needs to exist under spec/fixtures
        file = File.read('spec/fixtures/caliperBookmarkAnnotationEvent.json')
        data_hash = JSON.parse(file)
        expected_json = data_hash.to_json # convert hash back to JSON string after parse
        expect(event.to_json).to be_json_eql(expected_json)#.excluding("actor", "action", "object", "target", "generated", "ed_app", "group")

        # puts "JSON from file = #{data_hash}"
        deser_event = AnnotationEvent.new
        deser_event.from_json data_hash
        # puts "AnnotationEvent from JSON = #{deser_event.to_json}"

        # Ensure that the deserialized bookmark events object conforms
        expect(event).to eql(deser_event)
      end
    end
  end
end