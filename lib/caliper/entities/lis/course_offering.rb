require_relative './organization'
require_relative '../../entities/jsonable'

#
#
#  @copyright @copyright ©2013 IMS Global Learning Consortium, Inc.  All Rights Reserved.
#  @license For license information contact, info@imsglobal.org
#
#
#  a LIS Course Section
#
module Caliper
  module Entities
    module LIS

      class CourseOffering < Caliper::Entities::LIS::Organization
        include Caliper::Entities::Jsonable

        attr_accessor :courseNumber,
          :academicSession

        def initialize
          super
          @type = OrganizationType::COURSE_OFFERING
        end

      end
    end
  end
end
