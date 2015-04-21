require_relative 'event'

module Caliper
  module Event
    class AssessmentEvent < Event
      attr_accessor :context,
        :type,
        :action,
        :object,
        :target

      def initialize
        super
        @context = EventContext::ASSESSMENT
        @type = EventType::ASSESSMENT
      end
    end
  end
end
