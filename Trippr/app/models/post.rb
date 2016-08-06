class Post < ActiveRecord::Base
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates :body, :creator_id, :event_id, presence: true
  has_many :comments
  has_many :commenters, through: :comments, source: :user
  belongs_to :event
  belongs_to :creator, class_name: "User", foreign_key: "creator_id"
end
