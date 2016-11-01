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

require_relative './entity'
require_relative './entity_type'

#
# Caliper representation of a CreativeWork. We add learning specific attributes, including a list of
# LearningObjective learning objectives and a list of String keywords. See https://schema.org/CreativeWork.
#
module Caliper
  module Entities
    class DigitalResource < Entity

      caliper_type Caliper::Entities::EntityType::DIGITAL_RESOURCE

      caliper_property :learningObjectives, default: []
      caliper_property :datePublished
      caliper_property :isPartOf
      caliper_property :keywords,           default: []
      caliper_property :version

    end
  end
end
