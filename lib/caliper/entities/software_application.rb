require "json"
require_relative '../entities/entity'
require_relative '../entities/entity_type'

module Caliper
  module Entities
    class SoftwareApplication < Entity
	    attr_accessor :type

	    # Public:
      def to_json(*a)
	      {
		      "type" => @type
	      }.to_json(*a)
      end

	    def initialize()
				@type=Caliper::Entities::EntityType::SOFTWARE_APPLICATION
	    end
    end
  end
end
