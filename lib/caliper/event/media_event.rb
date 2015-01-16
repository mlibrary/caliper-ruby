require_relative 'event'
require_relative 'event_type'
require_relative 'event_context'
require_relative '../profiles/profile_actions'

module Caliper
  module Event
    class Navigation < Event
      attr_accessor :context,
                    :type,
                    :action,
                    :object,
                    :from_resource, #the resource from which the navigation starts
                    :target

      def initialize
      end
    end
  end
end
