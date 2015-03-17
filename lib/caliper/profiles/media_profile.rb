require_relative './profile'

module Caliper
  module Profiles

    module MediaActions
      ENABLEDCLOSECAPTIONING = 'enabledCloseCaptioning'
      DISABLEDCLOSEDCAPTIONING = 'disabledCloseCaptioning'
      CHANGEDVOLUME = 'changedVolume'
      MUTED = 'muted'
      UNMUTED = 'unmuted'
      CHANGEDSPEED = 'changedSpeed'
      ENDED = 'ended'
      JUMPEDTO = 'jumpedTo'
      FORWARDEDTO = 'forwardedTo'
      PAUSED = 'paused'
      RESUMED = 'resumed'
      REWINDED = 'rewindedTo'
      STARTED = 'started'
      CHANGEDRESOLUTION = 'changedResolution'
      CHANGEDVIEWERSIZE = 'changedViewerSize'
      CLOSEDPOPOUT = 'closedPopout'
      ENTEREDFULLSCREEN = 'enteredFullScreen'
      EXITEDFULLSCREEN = 'exitedFullScreen'
      OPENEDPOPOUT = 'openedPopout'
      NAVIGATED_TO = 'navigatedTo'
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
