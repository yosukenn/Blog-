class RemoveColumnFromArticles < ActiveRecord::Migration[5.0]
  def change
    remove_column :articles, :name, :string
    remove_column :articles, :user_id_id, :reference
  end
end
