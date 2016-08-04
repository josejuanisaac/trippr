require "rails_helper"

RSpec.describe EventsController, type: :controller do
  describe "POST events#create redirection" do
    it "should redirect from create to show" do
      post :create, event: {title: "test title", description: "test description", creator_id: 1}
      response.should redirect_to("/events/1")
    end

    it "should redirect from create to new" do
      post :create, event: {title: "test title", description: "test description"}
      response.should redirect_to("/events/new")
    end
  end

  describe "DELETE events#destroy redirection" do
    let(:event) {create(:event)}
    it "should redirect from destroy to index" do
      delete :destroy, id: event.id
      response.should redirect_to("/events")
    end
  end

  describe "PUT events#update redirection" do
    let(:event) {create(:event)}
    it "should redirect from update to show" do
      put :update, id: event.id, event: {title: "test title"}
      response.should redirect_to("/events/#{event.id}")
    end
  end
end