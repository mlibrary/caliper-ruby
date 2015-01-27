
# An Selector which describes a range of text based on its start and end positions
# Defined by: http://www.w3.org/ns/oa#d4e667

module Caliper
  module Entities
    module Annotation
      class TextPositionSelector
        attr_accessor :start,
                      :end
      end
    end
  end
end
