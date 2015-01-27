require_relative 'annotation'

module Caliper
  module Entities
    module Annotation
      class SharedAnnotation < Annotation
        attr_accessor :with_agents, # list of Agent object
                      :type

        def initialize()
          super
          @type = AnnotationType::SHARED_ANNOTATION
	        @with_agents = ''
        end
      end
    end
  end
end
