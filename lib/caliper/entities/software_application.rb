require "json"
require_relative '../entities/entity'
require_relative '../entities/foaf/agent'
require_relative '../entities/schemadotorg/software_application'

module Caliper
  module Entities
    class SoftwareApplication < Entity
	    include Caliper::Entities::FOAF::Agent
	    include Caliper::Entities::SchemaDotOrg::SoftwareApplication

	    attr_accessor :type

	    def initialize()
				@type=EntityType::SOFTWARE_APPLICATION
	    end
    end
  end
end
