require_relative './profile'
require_relative '../entities/digital_resource'
require_relative '../entities/annotation/annotation'
require_relative '../entities/reading/frame'

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
      NAVIGATED_TO = "http://purl.imsglobal.org/vocab/caliper/v1/action#NavigatedTo"
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
