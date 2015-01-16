module Caliper
  module Entity
    module Annotation
      class Bookmark < Base
        attr_accessor :notes

        def initialize(action)
          super
          @type = "http://purl.imsglobal.org/caliper/v1/BookmarkAnnotation"
        end
      end
    end
  end
end
