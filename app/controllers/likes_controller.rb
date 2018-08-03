class LikesController < ApplicationController
  def create
    Like.create(like_params)
    redirect_to root_path
  end

  def destroy
    like = Like.find(:id)
    like.destroy
  end

  private
  def like_params
    params.permit(:article_id).merge(user_id: current_user.id)
  end
end
