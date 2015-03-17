require_relative '../../entities/digital_resource'
require_relative '../../entities/schemadotorg/thing'

# An image, video, or audio object embedded in a web page. Note that a
# creative work may have many media objects associated with it on the
# same web page. For example, a page about a single song (MusicRecording)
# may have a music video (VideoObject), and a high and low bandwidth audio
# stream (2 AudioObject's).
#
# From https://schema.org/MediaObject

module Caliper
  module Entities
    module Media

      module MediaType
        AUDIO_OBJECT = 'http://purl.imsglobal.org/caliper/v1/AudioObject'
        IMAGE_OBJECT = 'http://purl.imsglobal.org/caliper/v1/ImageObject'
        VIDEO_OBJECT = 'http://purl.imsglobal.org/caliper/v1/VideoObject'
        MEDIA_LOCATION = 'http://purl.imsglobal.org/caliper/v1/MediaLocation'
      end

      ## implement the interface Thing
      class MediaObject < DigitalResource
        include Caliper::Entities::SchemaDotOrg::Thing

        attr_accessor :duration

        def initialize
          super
          @type = DigitalResourceType::MEDIA_OBJECT
          @duration = nil
        end

      end
    end
  end
end
