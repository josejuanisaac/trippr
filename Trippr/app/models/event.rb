class Event < ActiveRecord::Base
  belongs_to :creator, class_name: 'User'
  has_many :guests, foreign_key: 'user_id', class_name: 'User'
  has_many :posts
  has_many :comments through: :posts
end
