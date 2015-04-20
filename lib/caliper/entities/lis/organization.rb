require_relative '../../entities/foaf/agent'
require_relative '../../entities/entity'

module Caliper
  module Entities
    module LIS
      module OrganizationType
        COURSE_OFFERING = "http://purl.imsglobal.org/caliper/v1/lis/CourseOffering"
        LIS_COURSE_SECTION = "http://purl.imsglobal.org/caliper/v1/lis/CourseSection"
        GROUP = "http://purl.imsglobal.org/caliper/v1/lis/Group"
      end
      class Organization < Entity
        include Caliper::Entities::FOAF::Agent

        attr_accessor :membership,
        :subOrganizationOf

        def initialize
          super
          @type = EntityType::ORGANIZATION
        end
      end
    end
  end
end
