module Caliper
  module Event
    class Base
      attr_accessor :action, :agent, :context, :object, :type, :start_at, :end_at
    end
  end
end
