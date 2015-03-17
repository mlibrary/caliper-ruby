require_relative '../../entities/digital_resource'

#
# A time based location within a media object
#
module Caliper
  module Entities
    module Media

      class MediaLocation < DigitalResource

        attr_accessor :currentTime

        def initialize
          super
          @type = DigitalResourceType::MEDIA_LOCATION
          @currentTime = nil
        end

      end
    end
  end
end
