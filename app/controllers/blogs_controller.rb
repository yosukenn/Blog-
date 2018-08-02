class BlogsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :edit]

  def index
    @articles = Article.order('created_at DESC')
  end

  def new
    @article = Article.new
  end

  def create
    Article.create(article_params)
    redirect_to action: :index
  end

  def show
    @article = Article.find(params[:id])
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    redirect_to action: :index
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    article = Article.find(params[:id])
    article.update(article_params)
    redirect_to action: :index
  end

  private
  def article_params
    params.require(:article).permit(:text).merge(user_id: current_user.id)
  end
end
