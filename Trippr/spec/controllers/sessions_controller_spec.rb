require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let(:user) {create(:user)}

  describe "GET sessions#new" do
    it "responds successfully with an HTTP 200 status code" do
      get :new
      expect(response).to have_http_status(200)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "POST sessions#create" do
    it "creates a new session successfully" do
      post :create, user: {email: user.email, password: "test password"}
      expect(session[:user_id]).to eq(user.id)
    end
  end

  describe "DELETE sessions#destroy" do
    it "responds successfully with an HTTP 200 status code" do
      delete :destroy, id: user.id
      expect(response).to have_http_status(302)
    end

    it "has @user deleted" do
      post :create, user: {email: user.email, password: "test password"}
      delete :destroy, id: user.id
      expect(session[:user_id]).to be_nil
    end
  end
end
