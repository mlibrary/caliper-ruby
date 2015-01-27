require "json"
require_relative 'entity'
require_relative 'software_application'
require_relative 'lis/organization'
require_relative 'foaf/agent'

module Caliper
  module Entities
    class LearningContext < Entity
	    attr_accessor :ed_app, # SoftwareApplication educational app
                    :lis_organization, # Organization the LIS organization
	                  :agent # Agent the agent
	    def initialize
		    super
		    @ed_app = SoftwareApplication.new
		    @lis_organization = Caliper::Entities::LIS::Organization.new
		    @agent = Caliper::Entities::FOAF::Agent.new
	    end
	  end
  end
end
