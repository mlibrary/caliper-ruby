require "spec_helper.rb"
require "caliper"

module Caliper
  module Event
    describe Shared do
      it "should be a SharedEvent" do
        expect(Shared.new("action").type).to eq "SharedEvent"
      end

      it "should have a 'shared' or 'unshared' action, as appropriate" do
        expect(Shared.share.action).to eq "shared"
        expect(Shared.unshare.action).to eq "unshared"
      end
    end
  end
end

