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

require 'json'
require_relative './jsonable'

#
# Base event.
#
module Caliper
  module Event
    module EventContext
      ANNOTATION = "http://purl.imsglobal.org/ctx/caliper/v1/AnnotationEvent"
      ASSESSMENT = "http://purl.imsglobal.org/ctx/caliper/v1/AssessmentEvent"
      ASSESSMENT_ITEM = "http://purl.imsglobal.org/ctx/caliper/v1/AssessmentItemEvent"
      ASSIGNABLE = "http://purl.imsglobal.org/ctx/caliper/v1/AssignableEvent"
      EVENT = "http://purl.imsglobal.org/ctx/caliper/v1/Event"
      MEDIA = "http://purl.imsglobal.org/ctx/caliper/v1/MediaEvent"
      NAVIGATION = "http://purl.imsglobal.org/ctx/caliper/v1/NavigationEvent"
      OUTCOME = "http://purl.imsglobal.org/ctx/caliper/v1/OutcomeEvent"
      SESSION = "http://purl.imsglobal.org/ctx/caliper/v1/SessionEvent"
      VIEW = "http://purl.imsglobal.org/ctx/caliper/v1/ViewEvent"
    end

    module EventType
      ANNOTATION = "http://purl.imsglobal.org/caliper/v1/AnnotationEvent"
      ASSESSMENT = "http://purl.imsglobal.org/caliper/v1/AssessmentEvent"
      ASSESSMENT_ITEM = "http://purl.imsglobal.org/caliper/v1/AssessmentItemEvent"
      ASSIGNABLE = "http://purl.imsglobal.org/caliper/v1/AssignableEvent"
      EVENT = "http://purl.imsglobal.org/caliper/v1/Event"
      MEDIA = "http://purl.imsglobal.org/caliper/v1/MediaEvent"
      NAVIGATION = "http://purl.imsglobal.org/caliper/v1/NavigationEvent"
      OUTCOME = "http://purl.imsglobal.org/caliper/v1/OutcomeEvent"
      SESSION = "http://purl.imsglobal.org/caliper/v1/SessionEvent"
      VIEW = "http://purl.imsglobal.org/caliper/v1/ViewEvent"
    end

    class Event
      include Caliper::Event::Jsonable

      attr_accessor :context, # String Required - the JSON-LD context for the Event

        # Required - the type of the Event
        :type,

        # Required - Agent (User, System) that performed the action
        :actor,

        # Required - Action performed by Agent From Metric Profile (String)
        :action,

        # Required - Object
        :object,

        # Optional - Targeted object (Targetable)
        :target,

        # Optional - Generated object (Generatable)
        :generated,

        # Required time that the event was started at (ISO-8601 date string)
        :startedAtTime,

        # An optional time that the event ended at (ISO-8601 date string)
        :endedAtTime,

        # An xsd:duration (http://books.xmlschemata.org/relaxng/ch19-77073.html)
        # The String format is expected to be PnYnMnDTnHnMnS
        # Valid values include PT1004199059S, PT130S, PT2M10S, P1DT2S, -P1Y, or P1Y2M3DT5H20M30.123S.
        # The following values are invalid: 1Y (leading P is missing), P1S (T separator is missing),
        # P-1Y (all parts must be positive), P1M2Y (parts order is significant and Y must precede M)                                                                                                * or P1Y-1M (all parts must be positive).                                                                               */
        :duration,

        # edApp
        :edApp,

        # Group
        :group,

        # Membership
        :membership

      def initialize()
        @context = EventContext::EVENT
        @type = EventType::EVENT
        @actor = nil
        @action = nil
        @object = nil
        @target = nil
        @generated = nil
        @startedAtTime = Time.now.utc.iso8601(3)
        @endedAtTime = nil
        @duration = nil
        @edApp = nil
        @group = nil
        @membership = nil
      end
    end
  end
end