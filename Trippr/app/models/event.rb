class Event < ActiveRecord::Base
  belongs_to :creator, class_name: 'User'
  has_many :guest_events
  has_many :guests, through: :guest_events, source: :user
  has_many :posts
  has_many :comments, through: :posts
end