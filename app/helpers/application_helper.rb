module ApplicationHelper
  def like_present?(article)
    Like.find_by(user_id: current_user.id, article_id: article.id)
  end
end
