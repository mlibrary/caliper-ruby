require_relative 'event'
require_relative '../profiles/session_profile'

module Caliper
	module Event
		class SessionEvent < Event

			# Utilize builder to construct SessionEvent.  Validate Session object copy rather than the
			# Session builder.  This approach protects the class against parameter changes from another
			# thread during the "window of vulnerability" between the time the parameters are checked
			# until when they are copied.  Validate properties of builder copy and if conformance violations
			# are found throw an IllegalStateException (Bloch, Effective Java, 2nd ed., items 2, 39, 60, 63).
			def initialize
				super
				@context = Caliper::Event::EventContext::SESSION
				@type = Caliper::Event::EventType::SESSION
				@action = ""
				#session_profile = SessionProfile.new
				#session_profile.validate_event(this)
			end

		end
	end
end
