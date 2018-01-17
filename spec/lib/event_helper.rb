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

require 'spec_helper'

module Helper

  def session_event

    # Edapp
    ed_app = Caliper::Entities::Agent::SoftwareApplication.new
    ed_app.id = 'https://example.com/viewer'
    ed_app.name = 'ePub'
    ed_app.dateCreated = Time.utc(2015,8,1,6,0,0).iso8601(3)
    ed_app.dateModified = Time.utc(2015,9,2,11,30,0).iso8601(3)

    # Actor
    actor = Caliper::Entities::Agent::Person.new
    actor.id = 'https://example.edu/user/554433'
    actor.dateCreated = Time.utc(2015,8,1,6,0,0).iso8601(3)
    actor.dateModified = Time.utc(2015,9,2,11,30,0).iso8601(3)

    # Action
    action = Caliper::Actions::LOGGED_IN

    # Object
    obj = ed_app

    # Document parent (frame.isPartOf)
    document = Caliper::Entities::Reading::Document.new
    document.id = 'https://example.com/viewer/book/34843#epubcfi(/4/3)'
    document.name = 'The Glorious Cause: The American Revolution, 1763-1789 (Oxford History of the United States)'
    document.version = '2nd ed.'
    document.dateCreated = Time.utc(2015,8,1,6,0,0).iso8601(3)
    document.dateModified = Time.utc(2015,9,2,11,30,0).iso8601(3)

    # Target frame
    target = Caliper::Entities::Reading::Frame.new
    target.id = 'https://example.com/viewer/book/34843#epubcfi(/4/3/1)'
    target.name = 'Key Figures: George Washington'
    target.isPartOf = document
    target.version = document.version
    target.index = 1
    target.dateCreated = Time.utc(2015,8,1,6,0,0).iso8601(3)
    target.dateModified = Time.utc(2015,9,2,11,30,0).iso8601(3)

    # Generated session
    generated = Caliper::Entities::Session::Session.new
    generated.id = 'https://example.com/viewer/session-123456789'
    generated.name = 'session-123456789'
    generated.user = actor
    generated.startedAtTime = '2015-09-15T10:15:00.000Z'
    generated.dateCreated = Time.utc(2015,8,1,6,0,0).iso8601(3)
    generated.dateModified = Time.utc(2015,9,2,11,30,0).iso8601(3)

    # LIS Course Offering
    course = Caliper::Entities::LIS::CourseOffering.new
    course.id = 'https://example.edu/politicalScience/2015/american-revolution-101'
    course.name = 'Political Science 101: The American Revolution'
    course.courseNumber = 'POL101'
    course.academicSession = 'Fall-2015'
    course.dateCreated = Time.utc(2015,8,1,6,0,0).iso8601(3)
    course.dateModified = Time.utc(2015,9,2,11,30,0).iso8601(3)

    # LIS Course Section
    section = Caliper::Entities::LIS::CourseSection.new
    section.id = 'https://example.edu/politicalScience/2015/american-revolution-101/section/001'
    section.name = 'American Revolution 101'
    section.courseNumber = 'POL101'
    section.academicSession = 'Fall-2015'
    section.subOrganizationOf = course
    section.dateCreated = Time.utc(2015,8,1,6,0,0).iso8601(3)
    section.dateModified = Time.utc(2015,9,2,11,30,0).iso8601(3)

    # LIS Group
    group = Caliper::Entities::Agent::Group.new
    group.id = 'https://example.edu/politicalScience/2015/american-revolution-101/section/001/group/001'
    group.name = 'Discussion Group 001'
    group.subOrganizationOf = section
    group.dateCreated = Time.utc(2015,8,1,6,0,0).iso8601(3)

    membership = Caliper::Entities::LIS::Membership.new
    membership.id = 'https://example.edu/politicalScience/2015/american-revolution-101/roster/554433'
    membership.name = 'American Revolution 101'
    membership.description = 'Roster entry'
    membership.member = 'https://example.edu/user/554433'
    membership.organization = 'https://example.edu/politicalScience/2015/american-revolution-101/section/001'
    membership.roles = [Caliper::Entities::LIS::Role::LEARNER]
    membership.status = Caliper::Entities::LIS::Status::ACTIVE
    membership.dateCreated = Time.utc(2015,8,1,6,0,0).iso8601(3)

    # Create the Event
    event = Caliper::Events::SessionEvent.new
    event.actor  = actor
    event.action = action
    event.object = obj
    event.target = target
    event.generated = generated
    event.eventTime = Time.utc(2015,9,15,10,15,0).iso8601(3)
    event.edApp  = ed_app
    event.group = course
    event.membership = membership

    return event
  end
end
