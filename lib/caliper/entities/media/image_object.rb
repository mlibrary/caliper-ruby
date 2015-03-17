require_relative 'media_object'

# https://schema.org/ImageObject
#
# A image object embedded in a web page..

module Caliper
  module Entities
    module Media

      class ImageObject < MediaObject

        def initialize
          super
          @type = MediaType::IMAGE_OBJECT
        end

      end
    end
  end
end
