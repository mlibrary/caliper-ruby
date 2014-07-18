require "spec_helper.rb"
require "caliper"

module Caliper
  module Event
    describe Annotation do
      it "should raise error if instantiated directly" do
        expect(lambda{ Annotation.new("action") }).to raise_error NotImplementedError
      end
    end
  end
end
