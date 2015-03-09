
require_relative './profile'
require_relative '../entities/digital_resource'
require_relative '../entities/annotation/annotation'
require_relative '../entities/reading/frame'

module Caliper
  module Profiles
    module SessionActions
      LOGGED_IN = "session.loggedIn"
      LOGGED_OUT = "session.loggedOut"
      TIMEOUT = "session.timeOut"
      UNRECOGNIZED = "action.unrecognized"
    end
    class SessionProfile < Profile
      include SessionActions

      def initialize
        super
      end

      # whether object if of type DigitalResource
      def validate_event (event)

      end

    end
  end
end
