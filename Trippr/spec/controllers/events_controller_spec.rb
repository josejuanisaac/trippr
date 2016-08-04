require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  describe "GET events#index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all of the events into @events" do
      event1, event2 = create(:event), create(:event)
      get :index

      expect(assigns(:events)).to match_array([event1, event2])
    end
  end

  describe "GET events#new" do
    it "responds successfully with an HTTP 200 status code" do
      get :new
      expect(response).to have_http_status(200)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "GET events#show" do
    let(:event) {create(:event)}

    it "responds successfully with an HTTP 200 status code" do
      get :show, id: event.id
      expect(response).to have_http_status(200)
    end

    it "renders the show template" do
      get :show, id: event.id
      expect(response).to render_template("show")
    end

    it "has @event within event show page" do
      get :show, id: event.id
      expect(assigns(:event)).to eq(event)
    end
  end

  describe "POST events#create" do
    it "creates a new event successfully" do
      expect {
        post :create, event: {title: "test title", description: "test description", creator_id: 1}
      }.to change(Event, :count).by(1)
    end
  end

  describe "DELETE events#destroy" do
    let(:event) {create(:event)}
    it "responds successfully with an HTTP 200 status code" do
      delete :destroy, id: event.id
      expect(response).to have_http_status(302)
    end

    it "has @event deleted" do
      delete :destroy, id: event.id
      expect(assigns(:event)).to be_nil
    end
  end

  describe "GET events#edit" do
    let(:event) {create(:event)}

    it "responds successfully with an HTTP 200 status code" do
      get :edit, id: event.id
      expect(response).to have_http_status(200)
    end

    it "renders the edit template" do
      get :edit, id: event.id
      expect(response).to render_template("edit")
    end

    it "has @event within event edit page" do
      get :edit, id: event.id
      expect(assigns(:event)).to eq(event)
    end
  end

  describe "PUT events#update" do
    let(:event) {create(:event)}

    it "responds successfully with an HTTP 200 status code" do
      put :update, id: event.id, event: {title: "test title"}
      expect(response).to have_http_status(302)
    end

    it "has @event updated" do
      put :update, id: event.id, event: {title: "updated"}
      expect(assigns(:event).title).to eq('updated')
    end
  end
end
