require "spec_helper.rb"
require "caliper"

module Caliper
  module Event
    describe Used do
      it "should be a UsedEvent" do
        e = Used.new
        expect(e.type).to eq "UsedEvent"
        expect(e.action).to eq "used"
      end
    end
  end
end

