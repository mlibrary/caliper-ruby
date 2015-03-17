require_relative 'media_object'

# https://schema.org/VideoObject
#
# A video object embedded in a web page..

module Caliper
  module Entities
    module Media

      class VideoObject < MediaObject

        def initialize
          super
          @type = MediaType::VIDEO_OBJECT
        end

      end
    end
  end
end
