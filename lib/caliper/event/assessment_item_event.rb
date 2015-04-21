require_relative 'event'

module Caliper
  module Event
    class AssessmentItemEvent < Event
      attr_accessor :context,
        :type,
        :action,
        :object,
        :target

      def initialize
        super
        @context = EventContext::ASSESSMENT_ITEM
        @type = EventType::ASSESSMENT_ITEM
      end
    end
  end
end
