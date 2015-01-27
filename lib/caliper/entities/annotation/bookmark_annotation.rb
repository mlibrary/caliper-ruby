require_relative 'annotation'

module Caliper
  module Entities
    module Annotation
      class Bookmark < Annotation
        attr_accessor :type,
                      :bookmark_notes

        def initialize(action)
          super
          @type = AnnotationType::BOOKMARK_ANNOTATION
        end
      end
    end
  end
end
