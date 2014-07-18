require "spec_helper.rb"
require "caliper"

module Caliper
  module Event
    describe Commented do
      it "should be a CommentedEvent" do
        expect(Commented.new("action").type).to eq "CommentedEvent"
      end

      it "should have 'commented', 'comment-updated', or 'uncommented' actions, as appropriate" do
        expect(Commented.add_comment.action).to eq "commented"
        expect(Commented.remove_comment.action).to eq "uncommented"
        expect(Commented.update_comment.action).to eq "comment-updated"
      end
    end
  end
end

