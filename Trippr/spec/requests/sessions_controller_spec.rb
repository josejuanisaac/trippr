require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let(:user) {create(:user)}

  describe "POST users#create redirection" do
    it "should redirect from create to home page" do
      post :create, user: {email: user.email, password: "test password"}
      expect(response).to redirect_to("/")
    end

    it "should redirect from create to login" do
      post :create, user: {email: user.email, password: "wrong password"}
      expect(response).to redirect_to("/login")
    end
  end

  describe "DELETE users#destroy redirection" do
    it "should redirect from destroy to index" do
      post :create, user: {email: user.email, password: "test password"}
      delete :destroy, id: user.id
      expect(response).to redirect_to("/login")
    end
  end
end
