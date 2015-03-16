require_relative 'entity'
require_relative 'generatable'
require_relative 'targetable'
require_relative './jsonable'

#
#  @author Prashant Nayak
#  @copyright @copyright ©2013 IMS Global Learning Consortium, Inc.  All Rights Reserved.
#  @license For license information contact, info@imsglobal.org
#
#
#  Session Entity
#
module Caliper
  module Entities

    class Session < Entity
      include Generatable
      include Targetable
      include Caliper::Entities::Jsonable

      attr_accessor :actor,
        :startedAtTime,
        :endedAtTime,
        :duration

      def initialize
        super
        @type = EntityType::SESSION
      end

    end
  end
end
