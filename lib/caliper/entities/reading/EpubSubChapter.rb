module Caliper
  module Entity
    module Reading
      class EpubSubChapter < ::Caliper::Entity::DigitalResource
        def initialize(id)
          @id = id
          @type = "http://www.idpf.org/epub/vocab/structure/#subchapter"
        end
      end
    end
  end
end

