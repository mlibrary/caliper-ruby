
# contains the event information
module Caliper
	module Request
		class EventStoreEnvelope
			attr_accessor :id, :type, :time, :data
		end
	end
end
