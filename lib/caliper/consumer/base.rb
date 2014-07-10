module Caliper
  module Consumer
    class Base
      attr_reader :api_key

      def initialize(key, opts = {})
        @api_key = key
        @options = validate_options(opts)
      end

      def describe(type, id, props, timestamp); end

      def measure(action, learning_context, activity_context, timestamp); end

      def with_debug?
        @options[:debug]
      end

      def with_ssl?
        @options[:ssl]
      end

      def on_error(error)
        if with_debug?
          #todo: log if debug
        end

        if @options[:on_error]
          @options[:on_error].call(error)
        end
      end

      def validate_options(opts)
        hsh = {}
        hsh[:debug] = opts[:debug] ? true : false
        hsh[:ssl] = opts[:ssl] ? true : false
        if opts[:on_error]
          raise ArgumentError, "on_error option should be callable" unless opts[:on_error].is_a?(Proc) 
          hsh[:on_error] = opts[:on_error]
        end
        hsh
      end

    end
  end
end
