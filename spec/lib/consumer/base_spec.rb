require 'spec_helper.rb'

module Caliper
  module Consumer

    describe Base do
      
      it "should validate options hash" do
        b = Base.new("Some API key")
        expect(b.validate_options({:debug= => true, :ssl => false, :on_error => lambda { "blah blah" }, :some_other_key => "This will be ignored"})).not_to include(:some_other_key)
      end

      it "should enable debug and ssl" do
        b = Base.new("Some API key", :debug => true, :ssl => true)
        expect(b.with_debug?).to be_truthy
        expect(b.with_ssl?).to be_truthy
      end

      context "#on_error" do
        it "should call custom error handler" do
          Object.stubs(:non_existent_method).returns(true)
          p = proc { |e| Object.non_existent_method }
          Object.expects(:non_existent_method).once
          b = Base.new("Some API key", :on_error => p)
          b.on_error("Some error")
        end
      end
    end
  end
end
