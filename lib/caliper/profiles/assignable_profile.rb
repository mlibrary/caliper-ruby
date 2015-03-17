require_relative './profile'

module Caliper
  module Profiles

    module AssignableActions
      ABANDONED = 'abandoned'
      ACTIVATED = 'activated'
      COMPLETED = 'completed'
      DEACTIVATED = 'deactivated'
      HID = 'hid'
      REVIEWED = 'reviewed'
      SHOWED = 'showed'
      STARTED = 'started'
      SUBMITTED = 'submitted'
      NAVIGATED_TO = 'navigatedTo'
    end

    class AssignableProfile < Caliper::Profiles::Profile

      attr_accessor :key, # String
        :lookup # hash of AssignableActions

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
