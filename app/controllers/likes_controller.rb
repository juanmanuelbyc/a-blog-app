class LikesController < ApplicationController
  def create
    @post = params[:post_id]
    @user = current_user
    @like = Like.new(post_id: @post, author_id: @user.id)
    @like.save
    redirect_to user_post_path(@user.id, @post)
  end
end
