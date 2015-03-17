require_relative 'media_object'

# https://schema.org/AudioObject
#
# A audio object embedded in a web page..

module Caliper
	module Entities
		module Media

      class AudioObject < MediaObject

        def initialize
          super
          @type = MediaType::AUDIO_OBJECT
        end

      end
	end
end