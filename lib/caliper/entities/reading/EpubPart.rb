module Caliper
  module Entity
    module Reading
      class EpubPart < ::Caliper::Entity::DigitalResource
        def initialize(id)
          @id = id
          @type = "http://www.idpf.org/epub/vocab/structure/#part"
        end
      end
    end
  end
end
