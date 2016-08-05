require "rails_helper"

RSpec.describe UsersController, type: :controller do
  let(:user) {create(:user)}

  describe "POST users#create redirection" do
    it "should redirect from create to home page" do
      post :create, user: {username: "test username", email: "test email", password: "test password", password_confirmation: "test password"}
      expect(response).to redirect_to("/")
    end

    it "should redirect from create to new" do
      post :create, user: {username: "test username", email: "test email"}
      expect(response).to redirect_to("/signup")
    end
  end

  describe "DELETE users#destroy redirection" do
    it "should redirect from destroy to index" do
      delete :destroy, id: user.id
      expect(response).to redirect_to("/login")
    end
  end

  describe "PUT users#update redirection" do
    it "should redirect from update to show" do
      put :update, id: user.id, user: {title: "new username"}
      expect(response).to redirect_to("/users/#{user.id}")
    end
  end
end