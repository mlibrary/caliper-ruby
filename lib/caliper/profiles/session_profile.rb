
require_relative './profile'
require_relative '../entities/digital_resource'
require_relative '../entities/annotation/annotation'
require_relative '../entities/reading/frame'

module Caliper
  module Profiles
    module SessionActions
      LOGGED_IN = 'http://purl.imsglobal.org/vocab/caliper/v1/action#LoggedIn'
      LOGGED_OUT = 'http://purl.imsglobal.org/vocab/caliper/v1/action#LoggedOut'
      TIMED_OUT = 'http://purl.imsglobal.org/vocab/caliper/v1/action#TimedOut'
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
