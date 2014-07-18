require "spec_helper.rb"
require "caliper"

module Caliper
  module Event
    describe Tagged do
      it "should be a TaggedEvent" do
        expect(Tagged.new("action").type).to eq "TaggedEvent"
      end

      it "should have a 'tagged' or 'untagged' action, as appropriate" do
        expect(Tagged.tag.action).to eq "tagged"
        expect(Tagged.untag.action).to eq "untagged"
      end
    end
  end
end
