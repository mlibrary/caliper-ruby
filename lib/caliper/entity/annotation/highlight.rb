module Caliper
  module Entity
    module Annotation
      class Highlight < Base
        attr_accessor :selection

        def initialize(action)
          super(id);
          @type = "http://purl.imsglobal.org/caliper/v1/HighlightAnnotation"
          @selection = TextPositionSelector.new
        end

        def selected_text
          @selection.text
        end
      end
    end
  end
end
