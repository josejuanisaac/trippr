require "rails_helper"

RSpec.describe Post, :type => :model do
  context 'Test post validation' do
    it "Empty body is not valid" do
      example = Post.new(creator_id: 1, event_id:1)
      expect(example).to_not be_valid
    end

    it "Empty creator_id is not valid" do
      example = Post.new(body: "test body",event_id: 1)
      expect(example).to_not be_valid
    end

    it "Empty event_id is not valid" do
      example = Post.new(body: "test body", creator_id: 1)
      expect(example).to_not be_valid
    end

    it "Non-empty body, event_id, creator_id is valid" do
      example = create(:post)
      expect(example).to be_valid
    end
  end

  context 'Test post associations' do
    let(:users) {[create(:user), create(:user)]}
    let(:post) {create(:post)}
    let(:event) {create(:event)}
    let(:comments) {[Comment.create(content: "test content", user_id: users[0].id, post_id: 1), Comment.create(content: "test content", user_id: users[1].id, post_id: 1)]}

    it "A post has a creator" do
      users
      expect(post.creator).to eq(users[0])
    end

    it "A post has many commenters" do
      users
      comments
      expect(post.commenters).to eq(users)
    end

    it "A post has an event" do
      event
      expect(post.event).to eq(event)
    end

    it "A post has many comments" do
      comments
      expect(post.comments).to eq(comments)
    end
  end

  # context "Event instance methods" do
  #   let(:event) {create(:event)}
  #   let(:users) {[create(:user), create(:user)]}
  #   it "adds guests to an event" do
  #     expect{
  #       event.add_guests([users[0].id, users[1].id])
  #     }.to change{event.guests.length}.by(2)
  #   end

  #   it "deletes guests from an event" do
  #     GuestEvent.create(user_id: users[0].id, event_id: event.id)
  #     GuestEvent.create(user_id: users[1].id, event_id: event.id)
  #     event.delete_guests([users[0].id, users[1].id])
  #     expect(event.guests.length).to eq(0)
  #   end
  # end
end