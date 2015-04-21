require_relative './profile'

module Caliper
  module Profiles

    module MediaActions
      CHANGED_RESOLUTION = "http://purl.imsglobal.org/vocab/caliper/v1/action#ChangedResolution"
      CHANGED_SIZE = "http://purl.imsglobal.org/vocab/caliper/v1/action#ChangedSize"
      CHANGED_SPEED = "http://purl.imsglobal.org/vocab/caliper/v1/action#ChangedSpeed"
      CHANGED_VOLUME = "http://purl.imsglobal.org/vocab/caliper/v1/action#ChangedVolume"
      CLOSED_POPOUT = "http://purl.imsglobal.org/vocab/caliper/v1/action#ClosedPopout"
      DISABLED_CLOSED_CAPTIONING = "http://purl.imsglobal.org/vocab/caliper/v1/action#DisabledCloseCaptioning"
      ENABLED_CLOSE_CAPTIONING = "http://purl.imsglobal.org/vocab/caliper/v1/action#EnabledCloseCaptioning"
      ENDED = "http://purl.imsglobal.org/vocab/caliper/v1/action#Ended"
      ENTERED_FULLSCREEN = "http://purl.imsglobal.org/vocab/caliper/v1/action#EnteredFullScreen"
      EXITED_FULLSCREEN = "http://purl.imsglobal.org/vocab/caliper/v1/action#ExitedFullScreen"
      FORWARDED_TO = "http://purl.imsglobal.org/vocab/caliper/v1/action#ForwardedTo"
      JUMPED_TO = "http://purl.imsglobal.org/vocab/caliper/v1/action#JumpedTo"
      MUTED = "http://purl.imsglobal.org/vocab/caliper/v1/action#Muted"
      OPENED_POPOUT = "http://purl.imsglobal.org/vocab/caliper/v1/action#OpenedPopout"
      PAUSED = "http://purl.imsglobal.org/vocab/caliper/v1/action#Paused"
      RESUMED = "http://purl.imsglobal.org/vocab/caliper/v1/action#Resumed"
      REWOUND = "http://purl.imsglobal.org/vocab/caliper/v1/action#Rewound"
      STARTED = "http://purl.imsglobal.org/vocab/caliper/v1/action#Started"
      UNMUTED = "http://purl.imsglobal.org/vocab/caliper/v1/action#Unmuted"
      NAVIGATED_TO = "http://purl.imsglobal.org/vocab/caliper/v1/action#NavigatedTo"
    end

    class MediaProfile < Caliper::Profiles::Profile

      attr_accessor :key, # String
        :lookup # hash of MediaActions

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
