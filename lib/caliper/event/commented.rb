module Caliper
  module Event
    class Commented < Annotation
      def initialize(action)
        @context = "some uri"
        @type = "CommentedEvent"
        super
      end

      def self.add_comment
        self.new("commented")
      end

      def self.update_comment
        self.new("comment-updated")
      end

      def self.remove_comment
        self.new("uncommented")
      end
    end
  end
end
