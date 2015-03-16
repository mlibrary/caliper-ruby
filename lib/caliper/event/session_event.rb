require_relative 'event'
require_relative '../profiles/session_profile'

module Caliper
  module Event
    class SessionEvent < Event

      #
      # Session Event per the Caliper Session Profile
      # 
      def initialize
        super
        @context = Caliper::Event::EventContext::SESSION
        @type = Caliper::Event::EventType::SESSION
      end

    end
  end
end
