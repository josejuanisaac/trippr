class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :event_id
      t.string :body

      t.timestamps null: false
    end
  end
end
