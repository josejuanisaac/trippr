class User < ActiveRecord::Base
  has_many :events
  has_many :posts, through: :events
  has_many :comments
end
