# Public: Representation of an EPUB 3 subchapter
# A major sub-division of a chapter
# http://www.idpf.org/epub/vocab/structure/#subchapter

require_relative "../digital_resource"

module Caliper
  module Entities
    module Reading
      class EpubSubChapter < Caliper::Entities::DigitalResource
        def initialize()
	        super
          @id = ""
          @type = DigitalResourceType::EPUB_SUB_CHAPTER
        end
      end
    end
  end
end

