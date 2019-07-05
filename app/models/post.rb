class Post < ApplicationRecord
	has_many 		:comments, dependent: :destroy
	has_many 		:likes, as: :likeable, dependent: :destroy
	belongs_to		:user
	validates 		:title, presence: true, length: {minimum: 5}

	def already_liked?(user)
  	likes.where(user_id: user.id).exists?
	end

  	mount_uploader :avatar, AvatarUploader

end
