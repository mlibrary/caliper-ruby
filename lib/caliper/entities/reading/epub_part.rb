# Public: Representation of an EPUB 3 Part
# A major structural division of a piece of writing, typically
# encapsulating a set of related chapters.
# http://www.idpf.org/epub/vocab/structure/#part

require_relative "../digital_resource"

module Caliper
  module Entities
    module Reading
      class EpubPart < ::Caliper::Entity::DigitalResource
        def initialize()
	        super
          @id = ""
          @type = DigitalResourceType::EPUB_PART
        end
      end
    end
  end
end
