require_relative './profile'
require_relative '../entities/digital_resource'
require_relative '../entities/reading/frame'

module Caliper
  module Profiles

    module ReadingActions
      SEARCHED = "http://purl.imsglobal.org/vocab/caliper/v1/action#Searched"
      VIEWED = "http://purl.imsglobal.org/vocab/caliper/v1/action#Viewed"
      NAVIGATED_TO = "http://purl.imsglobal.org/vocab/caliper/v1/action#NavigatedTo"
    end

    class ReadingProfile < Caliper::Profiles::Profile

      attr_accessor :key, # String
        :lookup # hash of ReadingActions

      # whether object if of type DigitalResource
      def validate_object(object)
        if (object.is_a? DigitalResource)
          return object
        else
          fail "Object must e of type DigitalResource"
        end
      end

      # whether target is of type Frame
      def validate_target(target)
        if (target is_a? frame)
          return target
        else
          fail "Target must be of type Frame."
        end
      end
    end

  end
end
