class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :post_id
      t.integer :user_id
      t.string :content
      t.integer :thumbs

      t.timestamps null: false
    end
  end
end
