require_relative 'event'
require_relative '../profiles/reading_profile.rb'

module Caliper
  module Event

    class ViewEvent < Event

      #
      # Viewed Event per the Caliper Base Profile
      #
      def initialize
        @type = EventType::VIEW
        @context = EventContext::VIEW
      end

    end
  end
end
