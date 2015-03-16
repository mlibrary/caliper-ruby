require_relative 'event'
require_relative '../profiles/annotation_profile'

module Caliper
  module Event

    #
    # Annotation Event per Caliper Annotation Profile
    #
    class AnnotationEvent < Event

      def initialize
        @context = Caliper::Event::EventContext::ANNOTATION
        @type = Caliper::Event::EventType::ANNOTATION
      end
    end
  end
end
