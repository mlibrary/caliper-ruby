require_relative 'event'
require_relative '../profiles/profile'

module Caliper
  module Event
    class NavigationEvent < Event
      attr_accessor :context,
                    :type,
                    :action,
                    :object,
                    :from_resource, #the resource from which the navigation starts
                    :target

      def initialize
	      super
	      @context = EventContext::NAVIGATION
	      @type = EventType::NAVIGATION
	      @action = ProfileActions::NAVIGATED_TO
      end
    end
  end
end
