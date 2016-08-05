class Comment < ActiveRecord::Base
  validates :content, :post_id, :user_id, :thumbs,  presence: true
  belongs_to :post
  belongs_to :user
end