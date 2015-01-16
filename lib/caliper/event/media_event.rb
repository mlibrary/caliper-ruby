require_relative 'event'
require_relative 'event_type'
require_relative 'event_context'

module Caliper
  module Event
    class MediaEvent < Event
      attr_accessor :context,
                    :type,
                    :action,
                    :object,
                    :target

      def initialize
	      super
	      @context = EventContext::MEDIA
	      @type = EventType::MEDIA
      end
    end
  end
end
