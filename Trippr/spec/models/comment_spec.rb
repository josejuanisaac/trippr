require "rails_helper"

RSpec.describe Comment, :type => :model do
  context 'Test comment validation' do
    let(:comment) {create(:comment)}
    it "Empty content is not valid" do
      example = Comment.new(post_id: 1, user_id:1)
      expect(example).to_not be_valid
    end

    it "Empty post_id is not valid" do
      example = Comment.new(content: "test content", user_id: 1)
      expect(example).to_not be_valid
    end

    it "Empty user_id is not valid" do
      example = Comment.new(content: "test content", post_id: 1)
      expect(example).to_not be_valid
    end

    it "Non-empty content, user_id, post_id is valid" do
      expect(comment).to be_valid
    end

    it "New comment's default value is 0" do
      expect(comment.thumbs).to eq(0)
    end
  end

  context 'Test comment associations' do
    let(:user) {create(:user)}
    let(:post) {create(:post)}
    let(:comment) {create(:comment)}

    it "A comment has a creator" do
      user
      expect(comment.user).to eq(user)
    end

    it "A comment has a post" do
      post
      expect(comment.post).to eq(post)
    end
  end
end