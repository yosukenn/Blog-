class AddColumnToArticles < ActiveRecord::Migration[5.0]
  def change
    add_reference :articles, :user_id, foreign_key: true
  end
end
