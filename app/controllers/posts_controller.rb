class PostsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!, only: [:create]

  def index
    @user = User.includes(:posts).find(params[:user_id])
  end

  def show
    @post = Post.includes(:author, comments: [:author]).find(params[:id])
    @like = Like.new
  end

  def new
    @user = current_user
    @post = Post.new
  end

  def create
    @user = current_user
    @post = Post.new(params[:post])
    @post.author_id = @user.id
    @post.save
    redirect_to user_posts_path(@user)
  end

  private

  def destroy
    @post = Post.find(params[:id])
    authorize! :destroy, @post
    @post.destroy
    redirect_to user_posts_path(current_user), notice: 'Post was successfully deleted.'
  end
end
