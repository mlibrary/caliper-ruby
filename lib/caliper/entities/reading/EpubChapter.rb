module Caliper
  module Entity
    module Reading
      class EpubChapter < ::Caliper::Entity::DigitalResource
        def initialize(id)
          @id = id
          @type = "http://www.idpf.org/epub/vocab/structure/#chapter"
        end
      end
    end
  end
end
