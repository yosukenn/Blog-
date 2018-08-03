class LikesController < ApplicationController
  def create
    Like.create(article_id: like_params[:blog_id], user_id: current_user.id)
    redirect_to root_path
  end

  def destroy
    like = Like.find(params[:id])
    like.destroy
    redirect_to root_path
  end

  private
  def like_params
    params.permit(:blog_id)
  end
end
