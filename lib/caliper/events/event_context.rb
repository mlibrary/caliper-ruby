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

module Caliper
  module Events
    module EventContext
      extend Caliper::Properties::ClassMethods

      def self.included(base)
        base.caliper_property :edApp,            type: Caliper::Entities::EntityType::SOFTWARE_APPLICATION
        base.caliper_property :federatedSession, type: Caliper::Entities::EntityType::LTI_SESSION
        base.caliper_property :generated,        type: Caliper::Entities::EntityType::ENTITY
        base.caliper_property :group,            type: Caliper::Entities::EntityType::ORGANIZATION
        base.caliper_property :membership,       type: Caliper::Entities::EntityType::MEMBERSHIP
        base.caliper_property :session,          type: Caliper::Entities::EntityType::SESSION
        base.caliper_property :target,           type: Caliper::Entities::EntityType::ENTITY
      end

    end
  end
end
