class User < ActiveRecord::Base
  has_many :guest_events
  has_many :guested_events, through: :guest_events, source: :event
  has_many :created_events, class_name: "Event", foreign_key: "creator_id"
  has_many :comments
  has_many :commented_posts, through: :comments, source: :post
  has_many :created_posts, class_name: "Post", foreign_key: "creator_id"
end
