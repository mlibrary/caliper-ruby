module Caliper
  module Event
    class Base
      attr_accessor :action, :agent, :context, :activity_context, :learning_context, :type
    end
  end
end
