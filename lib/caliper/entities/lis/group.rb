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

      class Group < Caliper::Entities::LIS::Organization
        include Caliper::Entities::Jsonable

        def initialize
          super
          @type = OrganizationType::GROUP
        end

      end
    end
  end
end
