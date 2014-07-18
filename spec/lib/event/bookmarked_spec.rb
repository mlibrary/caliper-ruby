require "spec_helper.rb"
require "caliper"

module Caliper
  module Event
    describe Bookmarked do
      it "should be a BookmarkedEvent" do
        expect(Bookmarked.new("action").type).to eq "BookmarkedEvent"
      end

      it "should have a 'marked' or 'unmarked' action, as appropriate" do
        expect(Bookmarked.mark.action).to eq "marked"
        expect(Bookmarked.unmark.action).to eq "unmarked"
      end
    end
  end
end
