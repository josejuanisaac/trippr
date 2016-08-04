class Event < ActiveRecord::Base
  validates :title, :description, :creator_id, presence: true
  belongs_to :creator, class_name: 'User'
  has_many :guest_events
  has_many :guests, through: :guest_events, source: :user
  has_many :posts
  has_many :comments, through: :posts

  def add_guests(guest_ids)
    guest_ids.each do |guest_id|
      GuestEvent.create(event_id: self.id, user_id: guest_id)
    end
  end

  def delete_guests(guest_ids)
    guest_ids.each do |guest_id|
      GuestEvent.destroy(GuestEvent.find_by(event_id: self.id, user_id: guest_id).id)
    end
  end
end