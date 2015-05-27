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

      attr_accessor :context, :type, :actor, :action, :object,
                    :target, :generated, :startedAtTime, :endedAtTime, :duration,
                    :edApp, :group, :membership, :federatedSession

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
        @federatedSession = nil
      end
    end
  end
end