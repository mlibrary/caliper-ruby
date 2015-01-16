module Caliper
  module Entity
    module Annotation
      class Base < ::Caliper::Entity::Base
        attr_accessor :target

        def initialize(id)
          @id = id
          @type = "http://purl.imsglobal.org/caliper/v1/Annotation"
        end
      end
    end
  end
end
