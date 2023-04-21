class CommentsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  
  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end

  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = Comment.new(author_id: @user.id, post: @post, text: params[:comment][:text])
    @comment.save
    redirect_to user_post_path(@user, @post)
  end

  def destroy
    @comment = Comment.find(params[:id])
    authorize! :destroy, @comment
    @comment.destroy
    redirect_to user_post_path(params[:user_id], params[:post_id]), notice: 'Comment was successfully deleted.'
  end

  def comment_params
    @post = Post.find_by(id: params[:post_id])
    params
      .require(:comment)
      .permit(:text)
      .merge(author: current_user, post: current_user.posts.find(params[:post_id]))
      .merge(author: current_user, post: @post)
  end
end
