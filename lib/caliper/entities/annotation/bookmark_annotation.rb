require_relative 'annotation'

#
#  
#  @copyright @copyright ©2013 IMS Global Learning Consortium, Inc.  All Rights Reserved.
#  @license For license information contact, info@imsglobal.org
#
#
#  Bookmark Annotation Entity
#
module Caliper
  module Entities
    module Annotation

      class Bookmark < Annotation
        attr_accessor :bookmarkNotes

        def initialize
          super
          @type = AnnotationType::BOOKMARK_ANNOTATION
          @bookmarkNotes = nil
        end

      end
    end
  end
end
