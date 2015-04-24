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

require 'time'
require 'json'
require_relative './jsonable'

#
#  The base Caliper Entity.  Analogous to a schema.org Thing.
#
module Caliper
  module Entities
    module EntityType
      AGENT = "http://purl.imsglobal.org/caliper/v1/Agent"
      ATTEMPT = "http://purl.imsglobal.org/caliper/v1/Attempt"
      COURSE_OFFERING = "http://purl.imsglobal.org/caliper/v1/lis/CourseOffering"
      COURSE_SECTION = "http://purl.imsglobal.org/caliper/v1/lis/CourseSection"
      DIGITAL_RESOURCE = "http://purl.imsglobal.org/caliper/v1/DigitalResource"
      ENTITY = "http://purl.imsglobal.org/caliper/v1/Entity"
      GENERATED = "http://purl.imsglobal.org/caliper/v1/Generated"
      GROUP = "http://purl.imsglobal.org/caliper/v1/lis/Group"
      LEARNING_OBJECTIVE = "http://purl.imsglobal.org/caliper/v1/LearningObjective"
      MEMBERSHIP = "http://purl.imsglobal.org/caliper/v1/lis/Membership"
      ORGANIZATION = "http://purl.imsglobal.org/caliper/v1/w3c/Organization"
      PERSON = "http://purl.imsglobal.org/caliper/v1/lis/Person"
      RESPONSE = "http://purl.imsglobal.org/caliper/v1/Response"
      RESULT = "http://purl.imsglobal.org/caliper/v1/Result"
      SESSION = "http://purl.imsglobal.org/caliper/v1/Session"
      SOFTWARE_APPLICATION = "http://purl.imsglobal.org/caliper/v1/SoftwareApplication"
      TARGET = "http://purl.imsglobal.org/caliper/v1/Target"
      VIEW = "http://purl.imsglobal.org/caliper/v1/View"
    end

    class Entity
      include Caliper::Entities::Jsonable

      attr_accessor :id,
        :type,
        :name,
        :description,
        :extensions,
        :dateCreated,
        :dateModified

      def initialize()
        @id = ""
        @type = EntityType::ENTITY
        @name = nil
        @description = nil
        @extensions = {}
        @dateCreated = Time.now.utc.iso8601(3)
        @dateModified = Time.now.utc.iso8601(3)
      end

    end
  end
end
