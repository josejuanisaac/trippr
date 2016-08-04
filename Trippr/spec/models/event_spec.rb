require "rails_helper"

RSpec.describe Event, :type => :model do
  context 'Test event validation' do
    it "Empty title is not valid" do
      example = build(:event, description: "description", creator_id: 1)
      expect(example).to_not be_valid
    end

    it "Empty description is not valid" do
      example = build(:event, title: "title",creator_id: 1)
      expect(example).to_not be_valid
    end

    it "Empty create_id is not valid" do
      example = build(:event, title: "title", description: "description")
      expect(example).to_not be_valid
    end

    it "Non-empty title, description, create_id is valid" do
      example = create(:event, title: "title", description: "description", creator_id: 1)
      expect(example).to be_valid
    end
  end

  context 'Test event associations' do
    let(:users) {[User.create(email: "example1", username: "username1", password: "password1"), User.create(email: "example2", username: "username2", password: "password2")]}
    let(:event) {Event.create(title: "title", description: "description", creator_id: users[0].id)}
    let(:posts) {[Post.create(creator_id: 1, event_id: event.id, body: "long long time ago"), Post.create(creator_id: 2, event_id: event.id, body: "long long time ago")]}

    it "A event has a creator" do
      expect(event.creator).to eq(users[0])
    end

    it "A event has many guests" do
      users.each do |user|
        GuestEvent.create(user_id: user.id, event_id: event.id)
      end

      expect(event.guests).to eq(users)
    end

    it "A event has many posts" do
      expect(event.posts).to eq(posts)
    end

    it "An event has many comments" do
      comments = [Comment.create(post_id: posts[0].id, user_id: users[0].id, content: "example 1", thumbs: 0), Comment.create(post_id: posts[0].id, user_id: users[0].id, content: "example 2", thumbs: 0)]

      expect(event.comments).to eq(comments)
    end
  end
end