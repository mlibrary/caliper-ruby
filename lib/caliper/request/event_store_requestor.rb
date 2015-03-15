require 'securerandom'
require_relative 'event_store_envelope'

module Caliper
  module Request
    class EventStoreRequestor


      def get_payload_json(caliper_event, id, send_time)

        list_payload = Array.new

        # new event envelope
        envelope = EventStoreEnvelope.new
        envelope.id = id
        envelope.type = "caliperEvent"
        envelope.time = send_time.to_s
        envelope.data = caliper_event

        # add envelope into array
        list_payload<< envelope

        json_payload = JSON.generate(list_payload)
        return json_payload
      end

      def generate_payload(caliper_event, id, send_time)
        if (id.nil?)
          id = "caliper-java_" + SecureRandom.uuid
        end

        if (send_time.nil?)
          send_time = Time.now
        end

        json_payload = get_payload_json(caliper_event, id, send_time)

      end
    end
  end
end
