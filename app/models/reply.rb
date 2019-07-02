class Reply < ApplicationRecord
  belongs_to :comment
  has_many :likes, as: :likeable, dependent: :destroy
  belongs_to :user
  

  def already_liked?(user)
  	likes.where(user_id: user.id).exists?
	end
end
