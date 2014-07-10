require "spec_helper.rb"

module Caliper
  module Consumer
    describe Queue do
      it "should store max_queue_size and batch_size" do
        max = 1000
        batch = 100
        c = Queue.new("some API key", :max_queue_size => max, :batch_size => batch)
        expect(c.max_queue_size).to equal(max)
        expect(c.batch_size).to equal(batch)
      end
    end
  end
end

