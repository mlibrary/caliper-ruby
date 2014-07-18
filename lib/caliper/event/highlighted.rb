module Caliper
  module Event
    class Highlighted < Annotation
      def initialize(action)
        @context = "some uri"
        @type = "HighlightedEvent"
        super
      end

      def self.highlight
        self.new("highlighted")
      end

      def self.unhighlight
        self.new("unhighlighted")
      end
    end
  end
end
