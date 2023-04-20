class PostsController < ApplicationController
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
end
