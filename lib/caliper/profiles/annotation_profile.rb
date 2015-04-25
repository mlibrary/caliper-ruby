##
# This file is part of IMS Caliper Analytics™ and is licensed to
# IMS Global Learning Consortium, Inc. (http://www.imsglobal.org)
# under one or more contributor license agreements.  See the NOTICE
# file distributed with this work for additional information.
#
# IMS Caliper is free software: you can redistribute it and/or modify it under
# the terms of the GNU Lesser General Public License as published by the Free
# Software Foundation, version 3 of the License.
#
# IMS Caliper is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE.  See the GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License along
# with this program. If not, see http://www.gnu.org/licenses/.

require_relative './profile'
require_relative '../entities/digital_resource'
require_relative '../entities/annotation/annotation'
require_relative '../entities/reading/frame'

#
# Annotation Profile.
#
module Caliper
  module Profiles
    module AnnotationActions
      ATTACHED = "http://purl.imsglobal.org/vocab/caliper/v1/action#Attached"
      BOOKMARKED = "http://purl.imsglobal.org/vocab/caliper/v1/action#Bookmarked"
      CLASSIFIED = "http://purl.imsglobal.org/vocab/caliper/v1/action#Classified"
      COMMENTED = "http://purl.imsglobal.org/vocab/caliper/v1/action#Commented"
      DESCRIBED = "http://purl.imsglobal.org/vocab/caliper/v1/action#Described"
      DISLIKED = "http://purl.imsglobal.org/vocab/caliper/v1/action#Disliked"
      HIGHLIGHTED = "http://purl.imsglobal.org/vocab/caliper/v1/action#Highlighted"
      IDENTIFIED = "http://purl.imsglobal.org/vocab/caliper/v1/action#Identified"
      LIKED = "http://purl.imsglobal.org/vocab/caliper/v1/action#Liked"
      LINKED = "http://purl.imsglobal.org/vocab/caliper/v1/action#Linked"
      RANKED = "http://purl.imsglobal.org/vocab/caliper/v1/action#Ranked"
      QUESTIONED = "http://purl.imsglobal.org/vocab/caliper/v1/action#Questioned"
      RECOMMENDED = "http://purl.imsglobal.org/vocab/caliper/v1/action#Recommended"
      REPLIED = "http://purl.imsglobal.org/vocab/caliper/v1/action#Replied"
      SHARED = "http://purl.imsglobal.org/vocab/caliper/v1/action#Shared"
      SUBSCRIBED = "http://purl.imsglobal.org/vocab/caliper/v1/action#Subscribed"
      TAGGED = "http://purl.imsglobal.org/vocab/caliper/v1/action#Tagged"
    end

    class ReadingProfile < Profile
      include AnnotationActions
      attr_accessor :key, # String
        :lookup # hash of ReadingActions

      # whether object if of type DigitalResource
      def validate_object (object)
        if  (object.is_a? AnnotationType::BOOKMARK_ANNOTATION)
          ## TODO check required properties
          return object
        elsif (object.is_a? AnnotationType::HIGHLIGHT_ANNOTATION)
          ## TODO check required properties
          return object
        elsif  (object.is_a? AnnotationType::SHARED_ANNOTATION)
          ## TODO check required properties
          return object
        elsif  (object.is_a? AnnotationType::TAG_ANNOTATION)
          ## TODO check required properties
          return object
        else
          fail "Object must be of type Annotation"
        end
      end

      # whether target is of type Frame
      def validate_target(target)
        if (target is_a? Frame)
          return target
        else
          fail "Target must be of type Frame."
        end
      end
    end
  end
end