require_relative 'annotation'

#
#
#  @copyright @copyright ©2013 IMS Global Learning Consortium, Inc.  All Rights Reserved.
#  @license For license information contact, info@imsglobal.org
#
#
#  Hilight Annotation Entity
#
module Caliper
  module Entities
    module Annotation

      class HighlightAnnotation < Annotation
        attr_accessor :selectionText,
          :selection

        def initialize()
          super
          @type = AnnotationType::HIGHLIGHT_ANNOTATION
          @selectionText = nil
          @selection = {}
        end

      end
    end
  end
end
