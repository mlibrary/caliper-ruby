module Caliper
  module Consumer
    class Queue < Base
      attr_reader :max_queue_size, :batch_size

      def initialize(key, opts = {})
        super
        @queue = []
      end

      def validate_options(opts)
        hsh = super
        @max_queue_size = hsh[:max_queue_size] = opts[:max_queue_size].to_i
        @batch_size = hsh[:batch_size] = opts[:batch_size].to_i
        hsh
      end

      def measure(action, learning_context, activity_context, timestamp)
        enqueue OpenStruct.new(api_key: @api_key, action: action, learning_context: learning_context, activity_context: activity_context, timestamp: timestamp, proc_name: "measure")
      end

      def describe(type, id, properties, timestamp)
        enqueue OpenStruct.new(api_key: @api_key, entity_type: type, entity_id: id, properties: properties, timestamp: timestamp, proc_name: "describe")
      end

      def enqueue(item) 
        if item.proc_name == "measure"
          flush_measure(item)
        elsif item.proc_name == "describe"
          flush_describe(item)
        end
      end

      def flush_measure(item); end

      def flush_describe(item); end

    end
  end
end
