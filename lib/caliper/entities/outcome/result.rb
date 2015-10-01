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

require_relative '../entity_base'
require_relative '../entity_type'
require_relative '../generatable'

#
# LIS Result
#
module Caliper
	module Entities
    module Outcome
      class Result < EntityBase
        include Caliper::Entities::Generatable

        attr_accessor :assignable, :actor, :normalScore, :penaltyScore, :extraCreditScore,
                      :totalScore, :curvedTotalScore, :curveFactor, :comment, :scoredBy

        def initialize
          super
          @type = Caliper::Entities::EntityType::RESULT
          @assignable = nil
          @actor = nil
          @normalScore = nil
          @penaltyScore = nil
          @extraCreditScore = nil
          @totalScore = nil
          @curvedTotalScore = nil
          @curveFactor = nil
          @comment = nil
          @scoredBy = nil
        end
      end
    end
	end
end