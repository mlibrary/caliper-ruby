module Caliper
  module Event
    class Tagged < Annotation
      attr_accessor :tags

      def initialize(action)
        @context = "some uri"
        @type = "TaggedEvent"
        @tags = []
        super
      end

      def self.tag
        self.new("tagged")
      end

      def self.untag
        self.new("untagged")
      end
    end
  end
end
