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

describe Caliper::Events::Event do
  subject do
    described_class.new(
      actor: actor,
      action: Caliper::Actions::MODIFIED,
      object: object,
      eventTime: '2016-11-15T10:15:00.000Z',
      uuid: '5973dcd9-3126-4dcc-8fd8-8153a155361c',
      extensions: extensions
    )
  end

  let(:actor) do
    Caliper::Entities::Agent::Person.new(
      id: 'https://example.edu/users/554433',
    )
  end

  let(:object) do
    Caliper::Entities::Reading::Document.new(
      id: 'https://example.edu/terms/201601/courses/7/sections/1/resources/123',
      name: 'Course Syllabus',
      dateCreated: '2016-11-12T07:15:00.000Z',
      dateModified: '2016-11-15T10:15:00.000Z',
      version: '2'
    )
  end

  let(:extensions) do
    [
      {
        :'@context' => {
          id: '@id',
          type: '@type',
          previousVersion: 'http://example.edu/ctx/edu/previousVersion'
        },
        previousVersion: Caliper::Entities::Reading::Document.new(
          id: 'https://example.edu/terms/201601/courses/7/sections/1/resources/123?version=1'
        )
      }
    ]
  end

  include_examples 'validation against common fixture', 'caliperEventBasicModifiedExtended.json'
end
