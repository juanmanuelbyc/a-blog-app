class LikesController < ApplicationController
  def create
    @post = params[:post_id]
    @user = current_user
    @like = Like.new(user_id: @user.id, post_id: @post)

    if @like.save
      flash[:success] = 'Thanks for your like!'
    end
    redirect_to user_post_path(@user.id, @post)
  end
end
