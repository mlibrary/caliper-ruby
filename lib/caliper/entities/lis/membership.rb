require_relative './organization'
require_relative '../../entities/jsonable'

#
#  
#  @copyright @copyright ©2013 IMS Global Learning Consortium, Inc.  All Rights Reserved.
#  @license For license information contact, info@imsglobal.org
#
#
#  W3C Membership
#
module Caliper
  module Entities
    module LIS

      class Membership < Caliper::Entities::LIS::Organization
        include Caliper::Entities::Jsonable

        attr_accessor :member,
          :organization,
          :roles,
          :status

        def initialize
          super
          @type = EntityType::MEMBERSHIP
        end

      end
    end
  end
end
