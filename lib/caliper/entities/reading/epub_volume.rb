# Public: Representation of an EPUB 3 Volume
# A component of a collection
# http://www.idpf.org/epub/vocab/structure/#volume

require_relative '../digital_resource'
require_relative '../entity'

module Caliper
  module Entities
    module Reading
      class EpubVolume < Caliper::Entities::DigitalResource
        def initialize()
	        super
          @id = ""
          @type = DigitalResourceType::EPUB_VOLUME
        end
      end
    end
  end
end
