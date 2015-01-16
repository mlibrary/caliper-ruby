require "json"
require_relative 'base'

module Caliper
  module Entities
    class Agent
	    extend foaf::Agent
	    attr_accessor :type

	    # Public:
      def to_json(*a)
	      {
		      "type" => @type
	      }.to_json(*a)
      end

	    def initialize(type)
				@type=type
	    end
    end
  end
end
