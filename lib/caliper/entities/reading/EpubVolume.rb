module Caliper
  module Entity
    module Reading
      class EpubVolume < ::Caliper::Entity::DigitalResource
        def initialize(id)
          @id = id
          @type = "http://www.idpf.org/epub/vocab/structure/#volume"
        end
      end
    end
  end
end
