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

require_relative 'digital_resource'
require_relative '../entity_type'

#
# Deprecated.
#
# Representation of an EPUB 3 Chapter. A major structural division of a piece of writing.
# See http://www.idpf.org/epub/vocab/structure/#chapter
#
module Caliper
  module Entities
    module Reading
      class EpubChapter < Caliper::Entities::Resource::DigitalResource

        caliper_type Caliper::Entities::EntityType::EPUB_CHAPTER

        def initialize(opts={})
          warn '[DEPRECATION] Caliper::Entities::Reading::EpubChapter is deprecated.'
          super
        end

      end
    end
  end
end
