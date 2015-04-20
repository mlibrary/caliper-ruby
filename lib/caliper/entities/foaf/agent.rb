require_relative '../../entities/entity'
# Public: From http://xmlns.com/foaf/spec/#term_Agent An agent (eg. person,
#        group, software or physical artifact)
module Caliper
  module Entities
	  module FOAF
      module Agent
      	attr_accessor :hasMembership # Membership
      end
    end
  end
end
