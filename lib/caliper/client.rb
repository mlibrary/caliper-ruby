
module Caliper
  class Client
	  attr_accessor :api_key, :options, :stats
    def initialize(key, opts = {})
      if opts[:consumer]
        opts[:consumer] = Object.const_get(opts[:consumer]) if opts[:consumer].is_a?(String)
        opts[:consumer] = opts[:consumer].new(key, opts) if opts[:consumer].respond_to?(:new)
        raise ArgumentError, "Expecting Caliper::Consumer but got #{opts[:consumer].class.to_s}" unless opts[:consumer].is_a?(Caliper::Consumer::Base)
      end
      @consumer = opts[:consumer] || Caliper::Consumer::Socket.new(key, opts)
    end

    def measure(event, timestamp=nil)
      raise ArgumentError, "Expecting Caliper::Event but got #{event.class.to_s}" unless event.is_a?(Caliper::Event::Base)
      #todo ensure timestamp is iso8601
      timestamp ||= Time.now
      action = event.action
      # returned json will serialize nil contexts as []
      learning_context = event.learning_context ? event.learning_context : nil
      activity_context = event.activity_context ? event.activity_context : nil

      @consumer.measure(action, learning_context, activity_context, timestamp)
    end

    def describe(entity, timestamp=nil)
      raise ArgumentError, "Expecting Caliper::Entity but got #{entity.class.to_s}" unless entity.is_a?(Caliper::Entity::Base)
      #todo ensure timestamp is iso8601
      timestamp ||= Time.now
      @consumer.describe(entity.type, entity.id, entity.properties, Time.now)
    end
  end
end
