require_relative './profile'

module Caliper
  module Profiles

    module AssessmentActions
      PAUSED = "http://purl.imsglobal.org/vocab/caliper/v1/action#Paused"
      RESTARTED = "http://purl.imsglobal.org/vocab/caliper/v1/action#Restarted"
      STARTED = "http://purl.imsglobal.org/vocab/caliper/v1/action#Started"
      SUBMITTED = "http://purl.imsglobal.org/vocab/caliper/v1/action#Submitted"
      NAVIGATED_TO = "http://purl.imsglobal.org/vocab/caliper/v1/action#NavigatedTo"
    end

    module AssessmentItemActions
      COMPLETED = "http://purl.imsglobal.org/vocab/caliper/v1/action#Completed"
      REVIEWED = "http://purl.imsglobal.org/vocab/caliper/v1/action#Reviewed"
      SKIPPED = "http://purl.imsglobal.org/vocab/caliper/v1/action#Skipped"
      STARTED = "http://purl.imsglobal.org/vocab/caliper/v1/action#Started"
      VIEWED = "http://purl.imsglobal.org/vocab/caliper/v1/action#Viewed"
      NAVIGATED_TO = "http://purl.imsglobal.org/vocab/caliper/v1/action#NavigatedTo"
    end

    class AssessmentProfile < Caliper::Profiles::Profile

      attr_accessor :key, # String
        :lookup # hash of AssessmentActions

      # whether object if of type DigitalResource
      def validate_object(object)
        if (object.is_a? DigitalResource)
          return object
        else
          fail 'Object must e of type DigitalResource'
        end
      end

      # whether target is of type Frame
      def validate_target(target)
        if (target is_a? frame)
          return target
        else
          fail 'Target must be of type Frame'
        end
      end
    end

  end
end
