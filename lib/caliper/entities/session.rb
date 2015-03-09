
require_relative 'entity'
require_relative 'generatable'
require_relative 'targetable'


module Caliper
  module Entities
    class Session < Entity
      include Generatable
      include Targetable

      attr_accessor :type, # String
        :actorId, # Agent
        :started_at_time,
        :ended_at_time,
        :duration # String

      def initialize
        super
        @type = EntityType::SESSION
      end

    end
  end
end
