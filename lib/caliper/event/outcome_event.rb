require_relative 'event'
require_relative '../profiles/profile'

module Caliper
  module Event
    class OutcomeEvent < Event
      attr_accessor :context,
                    :type,
                    :action,
                    :object,
                    :generated

      def initialize
	      super
	      @context = EventContext::OUTCOME
	      @type = EventType::OUTCOME
      end
    end
  end
end
