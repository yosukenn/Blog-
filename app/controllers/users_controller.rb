class UsersController < ApplicationController

  def show
    @articles = Article.where(user_id: params[:id]).order('created_at DESC').includes(:user)
  end
end
