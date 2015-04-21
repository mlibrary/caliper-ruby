require_relative 'event'

module Caliper
  module Event
    class AssignableEvent < Event
      attr_accessor :context,
        :type,
        :action,
        :object,
        :target

      def initialize
        super
        @context = EventContext::ASSIGNABLE
        @type = EventType::ASSIGNABLE
      end
    end
  end
end
