require_relative '../../entities/digital_resource'
require_relative '../../entities/schemadotorg/thing'

#
#  @copyright @copyright ©2013 IMS Global Learning Consortium, Inc.  All Rights Reserved.
#  @license For license information contact, info@imsglobal.org
#
# Represents AssignableDigitalResource.
# AssignableDigitalResource's prototype set to DigitalResource
#

module Caliper
  module Entities
    module Assignable

      module AssignableDigitalResourceType
        ASSESSMENT = "http://purl.imsglobal.org/caliper/v1/Assessment"
        ASSESSMENT_ITEM = "http://purl.imsglobal.org/caliper/v1/AssessmentItem"
      end

      class AssignableDigitalResource < DigitalResource
        include Caliper::Entities::SchemaDotOrg::Thing

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
