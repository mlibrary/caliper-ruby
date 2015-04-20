require "json"
require_relative '../entities/entity'
require_relative '../entities/foaf/agent'
require_relative '../entities/schemadotorg/software_application'
require_relative '../entities/lis/organization'

#
#  
#  @copyright @copyright ©2013 IMS Global Learning Consortium, Inc.  All Rights Reserved.
#  @license For license information contact, info@imsglobal.org
#
#
#  Software Application (from schema.org)
#
module Caliper
  module Entities
    class SoftwareApplication < Caliper::Entities::LIS::Organization
      include Caliper::Entities::FOAF::Agent
      include Caliper::Entities::SchemaDotOrg::SoftwareApplication

      def initialize()
        super
        @type=EntityType::SOFTWARE_APPLICATION
      end

    end
  end
end
