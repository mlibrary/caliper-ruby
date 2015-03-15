module Caliper
  module Event
    class AnnotationEvent < Event::Event
      attr_accessor :location

      def initialize(action)
        @context = "http://purl.imsglobal.org/ctx/caliper/v1/AnnotationEvent"
		    @type = "http://purl.imsglobal.org/caliper/v1/AnnotationEvent"
        # only subclasses should be instantiated
        @action = action
      end
    end
  end
end
