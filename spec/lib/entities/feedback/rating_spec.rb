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

describe Caliper::Entities::Feedback::Rating do
  subject do
    described_class.new(
      id: 'https://example.edu/users/554433/rating/1',
      rater: actor,
      rated: object,
      question: question,
      selections: ["1"],
      ratingComment: comment,
      dateCreated: '2018-08-01T06:00:00.000Z',
    )
  end

  let(:actor) do
    Caliper::Entities::Agent::Person.new(
      id: 'https://example.edu/users/554433',
    )
  end

  let(:resource_collection) do
    Caliper::Entities::Resource::DigitalResourceCollection.new(
      id: 'https://example.edu/terms/201801/courses/7/sections/1/resources/1',
      name: 'Course Assets',
      isPartOf: group
    )
  end

  let(:object) do
    Caliper::Entities::Resource::DigitalResource.new(
      id: 'https://example.edu/terms/201801/courses/7/sections/1/resources/1/syllabus.pdf',
      name: 'Course Syllabus',
      mediaType: 'application/pdf',
      isPartOf: resource_collection,
      dateCreated: '2018-08-02T11:32:00.000Z'
    )
  end

  let(:group) do
    Caliper::Entities::LIS::CourseSection.new(
      id: 'https://example.edu/terms/201801/courses/7/sections/1'
    )
  end

  let(:comment) do
    Caliper::Entities::Feedback::Comment.new(
      id: 'https://example.edu/terms/201801/courses/7/sections/1/assess/1/items/6/users/665544/responses/1/comment/1',
      commenter: actor,
      commentedOn: object,
      value: 'I like what you did here but you need to improve on...',
      dateCreated: '2018-08-01T06:00:00.000Z'
    )
  end

  let(:question) do
    Caliper::Entities::Question::RatingScaleQuestion.new(
        id: 'https://example.edu/question/2',
        questionPosed: 'Do you agree with the opinion presented?',
        scale: scale
    )
  end

  let(:scale) do
    Caliper::Entities::Scale::LikertScale.new(
      id: 'https://example.edu/scale/2',
      scalePoints: 4,
      itemLabels: ["Strongly Disagree", "Disagree", "Agree", "Strongly Agree"],
      itemValues: [-2, -1, 1, 2]
    )
  end

  include_examples 'validation against common fixture', 'caliperEntityRating.json', optimize: {except: [:commenter, :rater, :isPartOf, :commentedOn]}
end
