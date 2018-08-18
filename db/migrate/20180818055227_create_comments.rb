class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :text
      t.reference :user
      t.reference :article

      t.timestamps
    end
  end
end
