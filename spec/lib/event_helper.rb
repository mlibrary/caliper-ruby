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
require_all 'lib/caliper/entities/reading/epub_volume.rb'
require_all 'lib/caliper/entities/reading/frame.rb'
require_all 'lib/caliper/entities/session/session.rb'
require_all 'lib/caliper/event/session_event.rb'
require_all 'lib/caliper/profiles/session_profile.rb'

module Helper

  def session_event

    # Edapp
    ed_app = Caliper::Entities::Agent::SoftwareApplication.new
    ed_app.id = 'https://example.com/viewer'
    ed_app.name = 'ePub'
    ed_app.dateCreated = '2015-08-01T06:00:00.000Z'
    ed_app.dateModified = '2015-09-02T11:30:00.000Z'

    # Actor
    actor = Caliper::Entities::Agent::Person.new
    actor.id = 'https://example.edu/user/554433'
    actor.dateCreated = '2015-08-01T06:00:00.000Z'
    actor.dateModified = '2015-09-02T11:30:00.000Z'

    # Action
    action = Caliper::Profiles::SessionActions::LOGGED_IN;

    # Object
    obj = ed_app

    # ePub parent (frame.isPartOf)
    ePub = Caliper::Entities::Reading::EPubVolume.new
    ePub.id = 'https://example.com/viewer/book/34843#epubcfi(/4/3)'
    ePub.name = 'The Glorious Cause: The American Revolution, 1763-1789 (Oxford History of the United States)'
    ePub.version = '2nd ed.'
    ePub.dateCreated = '2015-08-01T06:00:00.000Z'
    ePub.dateModified = '2015-09-02T11:30:00.000Z'

    # Target frame
    target = Caliper::Entities::Reading::Frame.new
    target.id = 'https://example.com/viewer/book/34843#epubcfi(/4/3/1)'
    target.name = 'Key Figures: George Washington'
    target.isPartOf = ePub
    target.version = ePub.version
    target.index = 1
    target.dateCreated = '2015-08-01T06:00:00.000Z'
    target.dateModified = '2015-09-02T11:30:00.000Z'

    # Generated session
    generated = Caliper::Entities::Session::Session.new
    generated.id = 'https://example.com/viewer/session-123456789'
    generated.name = 'session-123456789'
    generated.description = nil
    generated.actor = actor
    generated.startedAtTime = '2015-09-15T10:15:00.000Z'
    generated.endedAtTime = nil
    generated.duration = nil
    generated.dateCreated = '2015-08-01T06:00:00.000Z'
    generated.dateModified = '2015-09-02T11:30:00.000Z'

    # LIS Course Offering
    course = Caliper::Entities::LIS::CourseOffering.new
    course.id = "https://example.edu/politicalScience/2015/american-revolution-101"
    course.name = "Political Science 101: The American Revolution"
    course.courseNumber = "POL101"
    course.academicSession = "Fall-2015"
    course.subOrganizationOf = nil
    course.dateCreated = '2015-08-01T06:00:00.000Z'
    course.dateModified = '2015-09-02T11:30:00.000Z'

    # LIS Course Section
    section = Caliper::Entities::LIS::CourseSection.new
    section.id = 'https://example.edu/politicalScience/2015/american-revolution-101/section/001'
    section.name = 'American Revolution 101'
    section.courseNumber = "POL101"
    section.academicSession = "Fall-2015"
    section.category = nil
    section.subOrganizationOf = course
    section.dateCreated = '2015-08-01T06:00:00.000Z'
    section.dateModified = '2015-09-02T11:30:00.000Z'

    # LIS Group
    group = Caliper::Entities::LIS::Group.new
    group.id = "https://example.edu/politicalScience/2015/american-revolution-101/section/001/group/001"
    group.name = "Discussion Group 001"
    group.subOrganizationOf = section
    group.dateCreated = '2015-08-01T06:00:00.000Z'
    group.dateModified = nil

    membership = Caliper::Entities::LIS::Membership.new
    membership.id = "https://example.edu/politicalScience/2015/american-revolution-101/roster/554433"
    membership.name = "American Revolution 101"
    membership.description = "Roster entry"
    membership.member = "https://example.edu/user/554433"
    membership.organization = "https://example.edu/politicalScience/2015/american-revolution-101/section/001"
    membership.roles = [Caliper::Entities::LIS::Role::LEARNER]
    membership.status = Caliper::Entities::LIS::Status::ACTIVE
    membership.dateCreated = "2015-08-01T06:00:00.000Z"
    membership.dateModified = nil

    # Create the Event
    event = Caliper::Event::SessionEvent.new
    event.actor  = actor
    event.action = action
    event.object = obj
    event.target = target
    event.generated = generated
    event.startedAtTime = '2015-09-15T10:15:00.000Z'
    event.edApp  = ed_app
    event.group = course
    event.membership = membership
    event.federatedSession = nil

    return event
  end
end