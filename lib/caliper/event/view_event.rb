require_relative 'event'
require_relative '../profiles/reading_profile_key'

module Caliper
  module Event
    class ViewEvent < Event
      attr_accessor :context,
                    :type,
                    :action,
                    :object,
                    :target

      def initialize
        @type = EventType::VIEW
        @action = ReadingProfileKey::VIEWED
        @context = EventContext::VIEW
      end
    end
  end
end
