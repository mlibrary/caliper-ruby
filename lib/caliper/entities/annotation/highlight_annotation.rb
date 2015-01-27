require_relative 'annotation'

module Caliper
  module Entities
    module Annotation
      class HighlightAnnotation < Annotation
        attr_accessor :type,
                      :bookmark_notes

        def initialize()
          super
          @type = AnnotationType::HIGHLIGHT_ANNOTATION
          @bookmark_notes = ''
        end
      end
    end
  end
end
