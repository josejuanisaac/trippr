require "rails_helper"

RSpec.describe GuestEvent, :type => :model do
  context "Test guestevent validations" do
    it "Empty user_id is not valid" do
      example = GuestEvent.new(event_id: 1)
      expect(example).to_not be_valid
    end

    it "Empty event_id is not valid" do
      example = GuestEvent.new(user_id: 1)
      expect(example).to_not be_valid
    end

    it "Non-empty user_id and event_id is valid" do
      example = GuestEvent.new(user_id:1 ,event_id: 1)
        expect(example).to be_valid
    end
  end

  context "Test guestevent associations" do
    let(:user) {User.create(email: "example", username: "username", password: "password")}
    let(:event) {Event.create(title: "title", description: "description", creator_id: user.id)}
    let(:guestevent) {GuestEvent.create(user_id: user.id, event_id:event.id)}

    it "A guestevent belongs to a user" do
      expect(guestevent.user).to eq(user)
    end

    it "A guestevent belongs to a event" do
      expect(guestevent.event).to eq(event)
    end

  end
end