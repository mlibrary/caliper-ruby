require_relative './organization'
require_relative '../../entities/jsonable'

#
#  @author Prashant Nayak
#  @copyright @copyright ©2013 IMS Global Learning Consortium, Inc.  All Rights Reserved.
#  @license For license information contact, info@imsglobal.org
#
#
#  a LIS Course Section
#
module Caliper
  module Entities
    module LIS

      class CourseSection < Caliper::Entities::LIS::Organization
        include Caliper::Entities::Jsonable

        attr_accessor :semester,
          :courseNumber,
          :label

        def initialize
          super
          @type = OrganizationType::LIS_COURSE_SECTION
        end

      end
    end
  end
end
