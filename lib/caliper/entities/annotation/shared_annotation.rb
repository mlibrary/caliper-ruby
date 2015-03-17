require_relative 'annotation'

#
#  
#  @copyright @copyright ©2013 IMS Global Learning Consortium, Inc.  All Rights Reserved.
#  @license For license information contact, info@imsglobal.org
#
#
#  Shared Annotation Entity
#
module Caliper
  module Entities
    module Annotation

      class SharedAnnotation < Annotation
        attr_accessor :withAgents # list of Agent objects

        def initialize()
          super
          @type = AnnotationType::SHARED_ANNOTATION
	        @withAgents = Array.new
        end
        
      end
    end
  end
end
