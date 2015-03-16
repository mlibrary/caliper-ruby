require_relative '../digital_resource'
require_relative '../../entities/jsonable'

#
#  @author Prashant Nayak
#  @copyright @copyright ©2013 IMS Global Learning Consortium, Inc.  All Rights Reserved.
#  @license For license information contact, info@imsglobal.org
#
#  Public: Representation of an EPUB 3 Volume
#  A component of a collection
#  http://www.idpf.org/epub/vocab/structure/#volume
#
module Caliper
  module Entities
    module Reading

      class EPubVolume < Caliper::Entities::DigitalResource
        include Caliper::Entities::Jsonable

        def initialize()
	        super
          @type = DigitalResourceType::EPUB_VOLUME
        end

      end
    end
  end
end
