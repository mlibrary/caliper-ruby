require_relative 'event'
require_relative 'event_type'
require_relative 'event_context'
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
        @type = Caliper::Event::EventType::VIEW
        @action = Caliper::Profiles::ReadingProfileKey::VIEWED
        @context = Caliper::Event::EventContext::VIEW
      end
    end
  end
end
