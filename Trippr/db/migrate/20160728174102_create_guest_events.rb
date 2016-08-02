class CreateGuestEvents < ActiveRecord::Migration
  def change
    create_table :guest_events do |t|
      t.integer :user_id
      t.integer :event_id

      t.timestamps null: false
    end
  end
end
