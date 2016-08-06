class CommentsController < ApplicationController
  respond_to :html, :json

  # def index
  #   @comments = Comment.all
  # end

  def show
    @comment = Comment.find(params[:id])
    render json: @comment
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      render json: @comment
    else
      render json: @comment.errors.full_messages
    end
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    render json: @comment
  end

  def destroy
    Comment.find(params[:id]).destroy
    render json: {message: "The comment is deleted successfully.", status: 200}
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end
end
