class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
	has_many 		:likes, as: :likeable, dependent: :destroy
  has_many 		:replies, dependent: :destroy

  def already_liked?(user)
  	likes.where(user_id: user.id).exists?
	end
	
end
