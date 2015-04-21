require_relative '../../entities/entity'

#
#  @copyright @copyright ©2013 IMS Global Learning Consortium, Inc.  All Rights Reserved.
#  @license For license information contact, info@imsglobal.org
#
#
#  Represents an Attempt on an Assignable
#
module Caliper
  module Entities
    module Assignable

      class Attempt < Entity

        attr_accessor :assignable,
          :actor,
          :count,
          :startedAtTime,
          :endedAtTime,
          :duration

        def initialize
          super
          @type = EntityType::ATTEMPT
        end

      end

    end
  end
end
