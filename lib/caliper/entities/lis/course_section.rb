require_relative './organization'
require_relative '../lis/organization_type'

module Caliper
	module Entities
		module LIS
			class CourseSection < Caliper::Entities::LIS::Organization
				attr_accessor :type,
			                :semester,
			                :course_number,
			                :label
				def initialize
					super
					@type = Caliper::Entities::LIS::OrganizationType::LIS_COURSE_SECTION
				end
			end
		end
	end
end