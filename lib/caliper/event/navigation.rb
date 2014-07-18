module Caliper
  module Event
    class Navigation < Base
      attr_accessor :from_resource, :operation_type

      def initialize
        @context = "some uri"
        @type = "NavigationEvent"
        @action = "navigatedTo"
      end
    end
  end
end
