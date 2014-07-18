module Caliper
  module Event
    class Bookmarked < Annotation
      def initialize(action)
        @context  = "some uri"
        @type = "BookmarkedEvent"
        super
      end

      def self.mark
        self.new("marked")
      end

      def self.unmark
        self.new("unmarked")
      end
    end
  end
end
