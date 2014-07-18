module Caliper
  module Event
    class Viewed < Base
      attr_accessor :embedded_content

      def initialize
        @type = "ViewedEvent"
        @action = "viewed"
        @context = "some uri"
      end
    end
  end
end
