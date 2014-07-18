require "spec_helper.rb"
require "caliper"

module Caliper
  module Event
    describe Navigation do
      it "should be a NavigationEvent" do
        e = Navigation.new
        expect(e.type).to eq "NavigationEvent"
        expect(e.action).to eq "navigatedTo"
      end
    end
  end
end

