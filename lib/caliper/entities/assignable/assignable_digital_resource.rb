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

require_relative '../../entities/digital_resource'

#
# AssignableDigitalResource entity. AssignableDigitalResource's prototype is set to DigitalResource.
#
module Caliper
  module Entities
    module Assignable
      module AssignableDigitalResourceType
        ASSESSMENT = "http://purl.imsglobal.org/caliper/v1/Assessment"
        ASSESSMENT_ITEM = "http://purl.imsglobal.org/caliper/v1/AssessmentItem"
      end

      class AssignableDigitalResource < DigitalResource

        attr_accessor :dateToActivate,
          :dateToShow,
          :dateToStartOn,
          :dateToSubmit,
          :maxAttempts,
          :maxSubmits,
          :maxScore

        def initialize
          super
          @type = DigitalResourceType::ASSIGNABLE_DIGITAL_RESOURCE
          @dateToActivate = nil
          @dateToShow = nil
          @dateToStartOn = nil
          @dateToSubmit = nil
          @maxAttempts = nil
          @maxSubmits = nil
          @maxScore = nil
        end
     end
    end
  end
end