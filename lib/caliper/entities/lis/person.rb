require_relative '../../entities/entity'
require_relative '../../entities/foaf/agent.rb'
require_relative '../../entities/jsonable'
#
#  @author Prashant Nayak
#  @copyright @copyright ©2013 IMS Global Learning Consortium, Inc.  All Rights Reserved.
#  @license For license information contact, info@imsglobal.org
#
module Caliper
  module Entities
    module LIS
      # Represents Person.
      # @extends Agent
      class Person < Entity
        include Caliper::Entities::FOAF::Agent, Caliper::Entities::Jsonable

        def initialize
          super
          @type = EntityType::LIS_PERSON
        end

      end
    end
  end
end
