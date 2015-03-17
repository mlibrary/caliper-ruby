require_relative 'event'
require_relative '../profiles/profile'

module Caliper
  module Event
    class NavigationEvent < Event

      attr_accessor :navigatedFrom

      def initialize
	      super
	      @context = EventContext::NAVIGATION
	      @type = EventType::NAVIGATION
        @navigatedFrom = nil
      end
    end
  end
end
