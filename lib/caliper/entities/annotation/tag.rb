module Caliper
  module Entity
    module Annotation
      class Tag < Base
        attr_accessor :tags

        def initialize(id)
          super
          @type = "http://purl.imsglobal.org/caliper/v1/TagAnnotation"
        end
      end
    end
  end
end
