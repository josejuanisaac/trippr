require "rails_helper"

RSpec.describe Event, :type => :model do
  it "Empty title is not valid" do
    example = Event.new(description: "description", creator_id: 1)
    example.should_not be_valid
  end

  it "Empty description is not valid" do
    example = Event.new(title: "title",creator_id: 1)
    example.should_not be_valid
  end

  it "Empty create_id is not valid" do
    example = Event.new(title: "title", description: "description")
    example.should_not be_valid
  end

  it "Empty create_id is valid" do
    example = Event.new(title: "title", description: "description", creator_id: 1)
    example.should be_valid
  end

  it "A event has a creator" do
    user = User.create(email: "example", username: "username", password: "password")
    event = Event.create(title: "title", description: "description", creator_id: user.id)
    event.creator.should eq(user)
  end

  it "A event has a creator" do
    user = User.create(email: "example", username: "username", password: "password")
    event = Event.create(title: "title", description: "description", creator_id: user.id)
    event.creator.should eq(user)
  end
end