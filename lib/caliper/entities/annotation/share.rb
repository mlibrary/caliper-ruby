module Caliper
  module Entity
    module Annotation
      class Share < Base
        attr_accessor :recipients

        def initialize(id)
          super
          @type = "http://purl.imsglobal.org/caliper/v1/SharedAnnotation"
        end
      end
    end
  end
end
