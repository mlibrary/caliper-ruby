require_relative '../../entities/foaf/agent'
require_relative '../../entities/entity'

module Caliper
  module Entities
    module LIS
      module OrganizationType
        LIS_COURSE_SECTION = "http://purl.imsglobal.org/caliper/v1/lis/CourseSection"
      end
      class Organization < Entity
        include Caliper::Entities::FOAF::Agent
        attr_accessor :parentOrg # Organization

        def initialize
          super
          @type = EntityType::LIS_ORGANIZATION
          @parentOrg = nil
        end
      end
    end
  end
end
