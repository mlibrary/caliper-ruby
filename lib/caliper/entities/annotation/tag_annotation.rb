require_relative 'Annotation'

module Caliper
  module Entities
    module Annotation
      class TagAnnotation < Annotation
        attr_accessor :type,
                      :tags

        def initialize()
          super
          @type = AnnotationType::TAG_ANNOTATION
        end
      end
    end
  end
end
