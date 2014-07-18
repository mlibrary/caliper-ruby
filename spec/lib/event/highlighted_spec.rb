require "spec_helper.rb"
require "caliper"

module Caliper
  module Event
    describe Highlighted do
      it "should be a HighlightedEvent" do
        expect(Highlighted.new("action").type).to eq "HighlightedEvent"
      end

      it "should have a 'highlighted' or 'unhighlighted' action, as appropriate" do
        expect(Highlighted.highlight.action).to eq "highlighted"
        expect(Highlighted.unhighlight.action).to eq "unhighlighted"
      end
    end
  end
end

