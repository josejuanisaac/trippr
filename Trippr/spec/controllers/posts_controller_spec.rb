require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:post_example) {create(:post)}
  let(:event) {create(:event)}
  let(:users) {[create(:user), create(:user)]}
  let(:guestposts) {[Guestpost.create(user_id: users[0].id, post_id: post_example.id), Guestpost.create(user_id: users[1].id, post_id: post_example.id)]}

  # describe "GET posts#index" do
  #   it "responds successfully with an HTTP 200 status code" do
  #     get :index, event_id: 1
  #     expect(response).to have_http_status(200)
  #   end

  #   it "renders the index template" do
  #     get :index, event_id: 1
  #     expect(response).to render_template("index")
  #   end

  #   it "loads all of the posts into @posts" do
  #     post1, post2 = create(:post), create(:post)
  #     get :index, event_id: 1

  #     expect(assigns(:posts)).to match_array([post1, post2])
  #   end
  # end

  describe "GET posts#show" do
    it "responds successfully with an HTTP 200 status code" do
      get :show, event_id: 1, id: post_example.id
      expect(response).to have_http_status(200)
    end

    it "has @post as returned json object" do
      get :show, event_id: 1, id: post_example.id
      return_post = JSON.parse(response.body)
      expect(return_post["id"]).to eq(post_example.id)
      expect(return_post["body"]).to eq post_example.body
      expect(return_post["creator_id"]).to eq post_example.creator_id
      expect(return_post["event_id"]).to eq post_example.event_id
    end
  end

  describe "POST posts#create" do
    it "creates a new post successfully" do
      expect {
        post :create, event_id: event.id, post: {body: "test body", creator_id: users[0].id, event_id: event.id}
      }.to change(Post, :count).by(1)
    end

    it "creates a new post successfully and returns a post json object" do
      post :create, event_id: event.id, post: {body: "test body", creator_id: users[0].id, event_id: event.id}
      return_post = JSON.parse(response.body)
      expect(return_post["id"]).to eq(1)
      expect(return_post["body"]).to eq("test body")
      expect(return_post["creator_id"]).to eq(users[0].id)
      expect(return_post["event_id"]).to eq(event.id)
    end

    it "creates a new post successfully and returns a post json object" do
      post :create, event_id: event.id, post: {body: "test body", event_id: event.id}
      return_error = JSON.parse(response.body)
      expect(return_error[0]).to eq("Creator can't be blank")
    end
  end

  describe "DELETE posts#destroy" do
    it "responds successfully with an HTTP 200 status code" do
      delete :destroy, event_id: event.id, id: post_example.id
      expect(response).to have_http_status(200)
    end

    it "has @post deleted" do
      delete :destroy, event_id: event.id, id: post_example.id
      expect(JSON.parse(response.body)["message"]).to eq("The post is deleted successfully.")
    end
  end

  describe "PUT posts#update" do
    it "responds successfully with an HTTP 200 status code" do
      put :update, event_id: event.id, id: post_example.id, post: {body: "new content"}
      expect(response).to have_http_status(200)
    end

    it "has @post updated" do
      put :update, event_id: event.id, id: post_example.id, post: {body: "new content"}
      return_post = JSON.parse(response.body)
      expect(return_post["body"]).to eq("new content")
    end
  end
end
