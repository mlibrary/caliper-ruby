module Caliper
  autoload :Client, "caliper/client"
  
  module Consumer
    autoload :Base, "caliper/consumer/base"
    autoload :Queue, "caliper/consumer/queue"
    autoload :Socket, "caliper/consumer/socket"
  end

  module Event
    autoload :Base, "caliper/event/base"
  end

  module Entities
    autoload :Base, "caliper/entity/base"
  end
end
