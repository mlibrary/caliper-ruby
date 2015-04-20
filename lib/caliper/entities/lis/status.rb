require_relative '../../entities/entity'
require_relative '../../entities/foaf/agent.rb'
require_relative '../../entities/jsonable'
#
#
#  @copyright @copyright ©2013 IMS Global Learning Consortium, Inc.  All Rights Reserved.
#  @license For license information contact, info@imsglobal.org
#
module Caliper
  module Entities
    module LIS
      module Status
        ACTIVE = 'http://purl.imsglobal.org/vocab/lis/v2/status#Active'
        DELETED = 'http://purl.imsglobal.org/vocab/lis/v2/status#Deleted'
        INACTIVE = 'http://purl.imsglobal.org/vocab/lis/v2/status#Inactive'
      end
    end
  end
end
