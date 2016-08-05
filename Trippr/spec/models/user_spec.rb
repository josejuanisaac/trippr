require "rails_helper"

RSpec.describe User, :type => :model do
  context "Test user validations" do
    it "Empty email is not valid" do
      example = User.new(username: "username", password: "password", password_confirmation: "password")
        expect(example).to_not be_valid
    end

    it "Empty username is not valid" do
      example = User.new(email: "email", password: "password", password_confirmation: "password")
        expect(example).to_not be_valid
    end

    it "Empty password_digest is not valid" do
      example = User.new(email: "example", username: "username", password_confirmation: "password")
        expect(example).to_not be_valid
    end

    it "Non-empty email, username, password, and password_confirmation is valid" do
      example = create(:user)
        expect(example).to be_valid
    end
  end

  context "Test user associations" do
    let(:user) {create(:user)}
    let(:events) {[Event.create(title: "title", description: "description", creator_id: user.id), Event.create(title: "title1", description: "description1", creator_id: user.id)]}
    let(:posts) {[Post.create(creator_id: user.id, event_id: events[0].id, body: "long long time ago"), Post.create(creator_id: user.id, event_id: events[0].id, body: "long long time ago")]}
    let(:comments) {[Comment.create(post_id: posts[0].id, user_id: user.id, content: "This is good.", thumbs: 0), Comment.create(post_id: posts[1].id, user_id: user.id, content: "This is good.", thumbs: 0)]}

    it "A user has many created events" do
      expect(user.created_events).to eq(events)
    end

    it "A user has many guested events" do
      events.each do |event|
        GuestEvent.create(user_id: user.id, event_id: event.id)
      end
      expect(user.guested_events).to eq(events)
    end

    it "A user has many comments" do
      expect(user.comments).to eq(comments)
    end

    it "A user has many created_posts" do
      expect(user.created_posts).to eq(posts)
    end

    it "A user has many commented_posts" do
      comments = [Comment.create(post_id: posts[0].id, user_id: user.id, content: "This is good.", thumbs: 0), Comment.create(post_id: posts[1].id, user_id: user.id, content: "This is good.", thumbs: 0)]
      expect(user.commented_posts).to eq(posts)
    end
  end
end