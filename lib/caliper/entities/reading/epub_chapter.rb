require_relative "../digital_resource"

# Public: Representation of an EPUB 3 Chapter.
#
# A major structural division of a piece of writing
# http://www.idpf.org/epub/vocab/structure/#chapter

module Caliper
  module Entities
    module Reading
      class EpubChapter < DigitalResource
        def initialize()
	        super
          @id = id
          @type = DigitalResourceType::EPUB_CHAPTER
        end
      end
    end
  end
end