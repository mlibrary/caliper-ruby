require_relative 'Annotation'

#
#  
#  @copyright @copyright ©2013 IMS Global Learning Consortium, Inc.  All Rights Reserved.
#  @license For license information contact, info@imsglobal.org
#
#
#  Tag Annotation Entity
#
module Caliper
  module Entities
    module Annotation

      class TagAnnotation < Annotation
        attr_accessor :tags

        def initialize()
          super
          @type = AnnotationType::TAG_ANNOTATION
          @tags = Array.new
        end
        
      end
    end
  end
end
