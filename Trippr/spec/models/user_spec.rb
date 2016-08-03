require "rails_helper"

RSpec.describe User, :type => :model do
  it "Empty email is not valid" do
    example = User.new(username: "username", password: "password")
      example.should_not be_valid
  end

  it "Empty username is not valid" do
    example = User.new(email: "email", password: "password")
      example.should_not be_valid
  end

  it "Empty password is not valid" do
    example = User.new(email: "example", username: "username")
      example.should_not be_valid
  end

  it "Non-empty email, username and password is valid" do
    example = User.new(email: "example", username: "username", password: "password")
      example.should be_valid
  end

  it "A user has many events" do
    user = User.create(email: "example", username: "username", password: "password")
    event = Event.create(title: "title", description: "description", creator_id: user.id)
    user.created_events.first.should eq(event)
  end
end