class Comment < ActiveRecord::Base
  validates :content, :post_id, :user_id, :thumbs,  presence: true
  validates :content, length: { maximum: 140}
  belongs_to :post
  belongs_to :user
end
