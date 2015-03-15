require "spec_helper.rb"

module Caliper

  describe Client do

    it "should throw error if provided consumer is invalid" do
      expect(lambda{ Client.new("some API key", :consumer => "ThisClassTotally::DoesntExist") }).to raise_error(NameError)
      expect(lambda{ Client.new("some API key", :consumer => Object) }).to raise_error(ArgumentError)
    end

    it "should throw error if provided an invalid event" do
      expect(lambda{ Client.new("some API key").measure(Object.new) }).to raise_error(ArgumentError)
    end

#    it "should call the appropriate method on the consumer" do
#      consumer = Consumer::Base.new("some API key")
#      client = Client.new("some API key", :consumer => consumer)
#      consumer.expects(:measure)
#      consumer.expects(:describe)
#
#      client.measure(Event::Base.new)
#      client.describe(Entity::Base.new)
#    end
#
#    it "should default to current if timestamps are not provided" do
#      consumer = Consumer::Base.new("some API key")
#      client = Client.new("some API key", :consumer => consumer)
#      t = Time.now
#      Time.stubs(:now).returns(t)
#      consumer.expects(:measure).with(anything, anything, anything, t)
#      #todo same for describe
#      client.measure(Event::Base.new)
#    end

  end
end
