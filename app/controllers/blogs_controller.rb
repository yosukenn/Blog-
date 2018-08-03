class BlogsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :edit]

  def index
    @articles = Article.order('created_at DESC').page(params[:page]).per(5).includes(:user)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to root_path, notice: "投稿を完了しました。"
    else
      flash.now[:alert] = 'textを入力してください'
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    redirect_to root_path, notice: '投稿を削除しました。'
  end

  def edit
    @article = Article.find(params[:id])
    if user_signed_in? && current_user.id != @article.user_id
      redirect_to root_path
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to root_path, notice: "投稿を編集しました。"
    else
      flash.now[:alert] = 'textを入力してください'
      render :edit
    end
  end

  private
  def article_params
    params.require(:article).permit(:text).merge(user_id: current_user.id)
  end
end
