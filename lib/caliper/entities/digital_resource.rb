require "json"
require_relative 'entity'

#
#  
#  @copyright @copyright ©2013 IMS Global Learning Consortium, Inc.  All Rights Reserved.
#  @license For license information contact, info@imsglobal.org
#
# Public: Caliper representation of a CreativeWork (https://schema.org/CreativeWork)
# We add learning specific attributes, including a list of
# LearningObjective learning objectives and a list of
# String keywords
#
module Caliper
  module Entities

    module DigitalResourceType
      ASSIGNABLE_DIGITAL_RESOURCE = "http://purl.imsglobal.org/caliper/v1/AssignableDigitalResource"
      EPUB_CHAPTER = "http://www.idpf.org/epub/vocab/structure/#chapter"
      EPUB_PART = "http://www.idpf.org/epub/vocab/structure/#part"
      EPUB_SUB_CHAPTER = "http://www.idpf.org/epub/vocab/structure/#subchapter"
      EPUB_VOLUME = "http://www.idpf.org/epub/vocab/structure/#volume"
      FRAME = "http://purl.imsglobal.org/caliper/v1/Frame"
      MEDIA_LOCATION = "http://purl.imsglobal.org/caliper/v1/MediaLocation"
      MEDIA_OBJECT = "http://purl.imsglobal.org/caliper/v1/MediaObject"
      READING = "http://www.idpf.org/epub/vocab/structure"
      WEB_PAGE = "http://purl.imsglobal.org/caliper/v1/WebPage"
    end

    class DigitalResource < Entity
      include Caliper::Entities::Jsonable

      attr_accessor :objectType,
        :alignedLearningObjective,
        :keywords,
        :isPartOf,
        :datePublished

      def initialize
        super
        @type = EntityType::DIGITAL_RESOURCE
        @alignedLearningObjective = Array.new
        @objectType = Array.new
        @keywords = Array.new
        @datePublished = nil
      end

    end
  end
end
