require_relative 'entity'
require_relative 'generatable'
require_relative 'targetable'
require_relative './jsonable'

#
#  
#  @copyright @copyright ©2013 IMS Global Learning Consortium, Inc.  All Rights Reserved.
#  @license For license information contact, info@imsglobal.org
#
#
#  Learning Objective 
#
module Caliper
  module Entities

    class LearningObjective < Entity

      def initialize
        super
        @type = EntityType::LEARNING_OBJECTIVE
      end

    end
  end
end
