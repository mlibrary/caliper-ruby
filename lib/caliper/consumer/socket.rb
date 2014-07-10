module Caliper
  module Consumer
    class Socket < Queue

      def validate_options(opts)
        hsh = super(opts)
        hsh[:timeout] = opts[:timeout] || 0.5
        hsh[:host] = opts[:host] || "localhost"
        hsh
      end

      def flush_describe(item)
        socket = init_socket
      end

      def flush_measure(item)
        socket = init_socket
      end

      private

      def init_socket
        # coming soon
      end

    end
  end
end
