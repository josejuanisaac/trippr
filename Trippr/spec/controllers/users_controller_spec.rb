require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) {create(:user)}

  describe "GET users#new" do
    it "responds successfully with an HTTP 200 status code" do
      get :new
      expect(response).to have_http_status(200)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "GET users#show" do
    it "responds successfully with an HTTP 200 status code" do
      get :show, id: user.id
      expect(response).to have_http_status(200)
    end

    it "renders the show template" do
      get :show, id: user.id
      expect(response).to render_template("show")
    end

    it "has @user within event show page" do
      get :show, id: user.id
      expect(assigns(:user)).to eq(user)
    end
  end

  describe "POST users#create" do
    it "creates a new event successfully" do
      expect {
        post :create, user: {email: "test email", username: "test username", password: "test password", password_confirmation: "test password"}
      }.to change(User, :count).by(1)
    end
  end

  describe "DELETE users#destroy" do
    it "responds successfully with an HTTP 200 status code" do
      delete :destroy, id: user.id
      expect(response).to have_http_status(302)
    end

    it "has @user deleted" do
      delete :destroy, id: user.id
      expect(assigns(:user)).to be_nil
    end
  end

  describe "GET users#edit" do
    it "responds successfully with an HTTP 200 status code" do
      get :edit, id: user.id
      expect(response).to have_http_status(200)
    end

    it "renders the edit template" do
      get :edit, id: user.id
      expect(response).to render_template("edit")
    end

    it "has @user within user edit page" do
      get :edit, id: user.id
      expect(assigns(:user)).to eq(user)
    end
  end

  describe "PUT users#update" do
    it "responds successfully with an HTTP 200 status code" do
      put :update, id: user.id, user: {title: "test title"}
      expect(response).to have_http_status(302)
    end

    it "has @user updated" do
      put :update, id: user.id, user: {username: "new username"}
      expect(assigns(:user).username).to eq('new username')
    end
  end

end
