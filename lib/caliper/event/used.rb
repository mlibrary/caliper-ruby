module Caliper
  module Event
    class Used < Base
      attr_accessor :embedded_content, :use_threshold

      def initialize
        @type = "UsedEvent"
        @action = "used"
        @context = "some uri"
      end
    end
  end
end
