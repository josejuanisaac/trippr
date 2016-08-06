require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:post_example) {create(:post)}
  let(:users) {[create(:user), create(:user)]}
  let(:comments) {[Comment.create(content: "test content", user_id: users[0].id, post_id: post_example.id), Comment.create(content: "test content", user_id: users[1].id, post_id: post_example.id)]}

  # describe "GET comments#index" do
  #   it "responds successfully with an HTTP 200 status code" do
  #     get :index, event_id: 1, post_id: post_example.id
  #     expect(response).to have_http_status(200)
  #   end

  #   it "renders the index template" do
  #     get :index, event_id: 1, post_id: post_example.id
  #     expect(response).to render_template("index")
  #   end

  #   it "loads all of the comments into @comments" do
  #     post1, post2 = create(:post), create(:post)
  #     get :index, event_id: 1
  #     expect(assigns(:comments)).to match_array([post1, post2])
  #   end
  # end

  describe "GET comments#show" do
    it "responds successfully with an HTTP 200 status code" do
      get :show, event_id: 1, post_id: post_example.id, id: comments[0].id
      expect(response).to have_http_status(200)
    end

    it "has @post as returned json object" do
      get :show, event_id: 1, post_id: post_example.id, id: comments[0].id
      return_post = JSON.parse(response.body)
      expect(return_post["id"]).to eq(comments[0].id)
      expect(return_post["content"]).to eq comments[0].content
      expect(return_post["user_id"]).to eq comments[0].user_id
      expect(return_post["post_id"]).to eq comments[0].post_id
    end
  end

  describe "POST comments#create" do
    it "creates a new post successfully" do
      expect {
        post :create, event_id: 1, post_id: post_example.id, comment: {content: "test content", user_id: users[0].id, post_id: post_example.id}
      }.to change(Comment, :count).by(1)
    end

    it "creates a new post successfully and returns a post json object" do
      post :create, event_id: 1, post_id: post_example.id, comment: {content: "test content", user_id: users[0].id, post_id: post_example.id}
      return_post = JSON.parse(response.body)
      expect(return_post["id"]).to eq(1)
      expect(return_post["content"]).to eq("test content")
      expect(return_post["user_id"]).to eq(users[0].id)
      expect(return_post["post_id"]).to eq(1)
    end

    it "creates a new post successfully and returns a post json object" do
      post :create, event_id: 1, post_id: post_example.id, comment: {content: "test content", user_id: users[0].id}
      return_error = JSON.parse(response.body)
      expect(return_error[0]).to eq("Post can't be blank")
    end
  end

  describe "DELETE comments#destroy" do
    it "responds successfully with an HTTP 200 status code" do
      delete :destroy, event_id: 1, post_id: post_example.id, id: comments[0].id
      expect(response).to have_http_status(200)
    end

    it "has @post deleted" do
      delete :destroy, event_id: 1, post_id: post_example.id, id: comments[0].id
      expect(JSON.parse(response.body)["message"]).to eq("The comment is deleted successfully.")
    end
  end

  describe "PUT comments#update" do
    it "responds successfully with an HTTP 200 status code" do
      put :update, event_id: 1, post_id: post_example.id, id: comments[0].id, comment: {content: "new content"}
      expect(response).to have_http_status(200)
    end

    it "has @post updated" do
      put :update, event_id: 1, post_id: post_example.id, id: comments[0].id, comment: {content: "new content"}
      return_post = JSON.parse(response.body)
      expect(return_post["content"]).to eq("new content")
    end
  end
end
