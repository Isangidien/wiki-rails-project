require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:wiki) { Wiki.create!(title: "New Wiki Title", body: "New Wiki Body") }
  let(:comment) { Comment.create!(body: 'Comment Body', wiki: wiki) }

  describe "attributes" do
    it "has a body attribute" do
      expect(comment).to have_attributes(body: "Comment Body")
    end
  end
end
