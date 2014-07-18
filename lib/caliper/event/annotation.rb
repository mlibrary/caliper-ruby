module Caliper
  module Event
    class Annotation < Base
      attr_accessor :location

      def initialize(action)
        # only subclasses should be instantiated
        raise NotImplementedError unless @type
        @action = action
      end
    end
  end
end
