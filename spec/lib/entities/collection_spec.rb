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

describe Caliper::Entities::Collection do

  subject do
    described_class.new(
      id: 'urn:uuid:9e5987b9-31db-48bf-8dfb-4f6055a8c5db',
      items: [
        Caliper::Entities::Entity.new(
          id: 'urn:uuid:81e6326d-e57e-43b8-a949-e8a835b4462a'
        ),
        Caliper::Entities::Entity.new(
          id: 'urn:uuid:f83086d9-d046-4464-8fbe-c8e4f9e8d7e2'
        )
      ]
    )
  end

  include_examples 'validation against common fixture', 'caliperEntityCollection.json', optimize: :none
end
