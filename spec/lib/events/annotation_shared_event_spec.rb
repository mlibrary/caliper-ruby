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

describe Caliper::Events::AnnotationEvent do
  subject do
    described_class.new(
      actor: actor,
      action: Caliper::Actions::SHARED,
      edApp: ed_app,
      eventTime: '2016-11-15T10:15:00.000Z',
      generated: shared_annotation,
      group: group,
      membership: membership,
      object: object,
      session: session
    )
  end

  let(:actor) do
    Caliper::Entities::Agent::Person.new(
      id: 'https://example.edu/users/554433',
    )
  end

  let(:ed_app) do
    Caliper::Entities::Agent::SoftwareApplication.new(
      id: 'https://example.edu',
      version: '1.2.3'
    )
  end

  let(:group) do
    Caliper::Entities::LIS::CourseSection.new(
      id: 'https://example.edu/terms/201601/courses/7/sections/1',
      courseNumber: 'CPS 435-01',
      academicSession: 'Fall 2016'
    )
  end

  let(:membership) do
    Caliper::Entities::LIS::Membership.new(
      id: 'https://example.edu/terms/201601/courses/7/sections/1/rosters/1',
      member: actor,
      organization: Caliper::Entities::LIS::CourseSection.new(
        id: 'https://example.edu/terms/201601/courses/7/sections/1',
      ),
      roles: [
        Caliper::Entities::LIS::Role::LEARNER
      ],
      status: Caliper::Entities::LIS::Status::ACTIVE,
      dateCreated: '2016-08-01T06:00:00.000Z'
    )
  end

  let(:object) do
    Caliper::Entities::Reading::Document.new(
      id: 'https://example.edu/etexts/201.epub',
      name: 'IMS Caliper Implementation Guide',
      version: '1.1'
    )
  end

  let(:session) do
    Caliper::Entities::Session::Session.new(
      id: 'https://example.edu/sessions/1f6442a482de72ea6ad134943812bff564a76259',
      startedAtTime: '2016-11-15T10:00:00.000Z'
    )
  end

  let(:shared_annotation) do
    Caliper::Entities::Annotation::SharedAnnotation.new(
      id: 'https://example.edu/users/554433/etexts/201/shares/1',
      actor: actor,
      annotated: Caliper::Entities::Reading::Document.new(
        id: 'https://example.edu/etexts/201.epub'
      ),
      withAgents: [
        Caliper::Entities::Agent::Person.new(
          id: 'https://example.edu/users/657585',
        ),
        Caliper::Entities::Agent::Person.new(
          id: 'https://example.edu/users/667788',
        )
      ],
      dateCreated: '2016-11-15T10:15:00.000Z'
    )
  end

  include_examples 'validation against common fixture', 'caliperEventAnnotationShared.json'
end
