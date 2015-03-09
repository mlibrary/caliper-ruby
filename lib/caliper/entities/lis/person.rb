require_relative '../../entities/entity'

module Caliper
  module Entities
    module LIS
      class Person < Entity
        include Caliper::Entities::FOAF::Agent
        attr_accessor :type # String

        def initialize
          super
          @type = EntityType::LIS_PERSON
        end
      end
    end
  end
end
