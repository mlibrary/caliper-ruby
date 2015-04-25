##
# This file is part of IMS Caliper Analytics™ and is licensed to
# IMS Global Learning Consortium, Inc. (http://www.imsglobal.org)
# under one or more contributor license agreements.  See the NOTICE
# file distributed with this work for additional information.
#
# IMS Caliper is free software: you can redistribute it and/or modify it under
# the terms of the GNU Lesser General Public License as published by the Free
# Software Foundation, version 3 of the License.
#
# IMS Caliper is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE.  See the GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License along
# with this program. If not, see http://www.gnu.org/licenses/.

require_relative '../../entities/digital_resource'
require_relative '../../entities/schemadotorg/thing'

# An image, video, or audio object embedded in a web page. Note that a
# creative work may have many media objects associated with it on the
# same web page. For example, a page about a single song (MusicRecording)
# may have a music video (VideoObject), and a high and low bandwidth audio
# stream (2 AudioObject's).  See From https://schema.org/MediaObject.
#
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
