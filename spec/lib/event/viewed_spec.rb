require "spec_helper.rb"
require "caliper"

module Caliper
  module Event
    describe Viewed do
      it "should be a ViewedEvent" do
        e = Viewed.new
        expect(e.type).to eq "ViewedEvent"
        expect(e.action).to eq "viewed"
      end
    end
  end
end

