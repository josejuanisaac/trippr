require "rails_helper"

RSpec.describe EventsController, type: :controller do
  let(:event) {create(:event)}
  let(:users) {[create(:user), create(:user)]}
  let(:guestevents) {[GuestEvent.create(user_id: users[0].id, event_id: event.id), GuestEvent.create(user_id: users[1].id, event_id: event.id)]}

  describe "POST events#create redirection" do
    it "should redirect from create to show" do
      post :create, event: {title: "test title", description: "test description", creator_id: 1}
      expect(response).to redirect_to("/events/1")
    end

    it "should redirect from create to new" do
      post :create, event: {title: "test title", description: "test description"}
      expect(response).to redirect_to("/events/new")
    end
  end

  describe "DELETE events#destroy redirection" do
    it "should redirect from destroy to index" do
      delete :destroy, id: event.id
      expect(response).to redirect_to("/events")
    end
  end

  describe "PUT events#update redirection" do
    it "should redirect from update to show" do
      put :update, id: event.id, event: {title: "test title"}
      expect(response).to redirect_to("/events/#{event.id}")
    end
  end

  describe "PUT events#add_guest redirection" do
    it "should redirect from update to show" do
      put :add_guests, event_id: event.id, guests: [users[0].id, users[1].id]
      expect(response).to redirect_to("/events/#{event.id}")
    end
  end

  describe "DELETE events#delete_guest redirection" do
    it "should redirect from update to show" do
      guestevents
      put :delete_guests, event_id: event.id, guests: [users[0].id, users[1].id]
      expect(response).to redirect_to("/events/#{event.id}")
    end
  end
end