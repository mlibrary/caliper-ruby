module Caliper
  module Event
    class Shared < Annotation
      def initialize(type)
        @context = "some uri"
        @type = "SharedEvent"
        super
      end

      def self.share
        self.new("shared")
      end

      def self.unshare
        self.new("unshared")
      end
    end
  end
end
