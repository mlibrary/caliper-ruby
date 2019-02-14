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

describe Caliper::Entities::Feedback::NumericScale do
  subject do
    described_class.new(
      id: 'https://example.edu/scale/4',
      question: 'How do you feel about this content?',
      minValue: 0.0,
      minLabel: 'Disliked',
      maxValue: 10.0,
      maxLabel: 'Liked',
      step: 0.5,
      dateCreated: '2018-08-01T06:00:00.000Z'
    )
  end

  include_examples 'validation against common fixture', 'caliperEntityNumericScale.json'
end
