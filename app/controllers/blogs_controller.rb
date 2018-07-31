class BlogsController < ApplicationController

  def index
    @articles = Article.order('created_at DESC')
  end

  def new
    @article = Article.new
  end

  def create
    Article.create(article_params)
  end

  def show
    @article = Article.find(params[:id])
  end

  def destroy
  end

  def edit
  end

  private
  def article_params
    params.require(:article).permit(:name, :text)
  end
end
