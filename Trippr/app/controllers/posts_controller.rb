class PostsController < ApplicationController
  respond_to :html, :json

  # def index
  #   @posts = Post.all
  # end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.where(post_id: params[:id])
    # render json: @comments
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      @post = @post.as_json.merge({comments: @post.comments.as_json})

      p "successfully posted"
      render json: @post
    else
      p "error posting"
      render json: @post.errors.full_messages
    end
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    render json: @post
  end

  def destroy
    Post.find(params[:id]).destroy
    render json: {message: "The post is deleted successfully.", status: 200}
  end

  private
  def post_params
    params.require(:post).permit(:body, :event_id, :creator_id, :avatar)
  end
end
