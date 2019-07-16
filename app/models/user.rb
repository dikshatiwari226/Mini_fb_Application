class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :authentications
  has_many	:posts
  has_many 	:likes, dependent: :destroy
  has_many :friendships 
  has_many  :messages
  has_many  :conversations, foreign_key: :sender_id
	validates :email, :presence => true

	def name
		email.split('@')[0]
	end

  def request_not_send?(user)
    Friendship.where(sender_id: [self.id, user.id], receiver_id: [self.id, user.id]).blank?
  end

  def request_send?(user)
    Friendship.where(sender_id: self.id, receiver_id: user.id).any?
  end

  def friendship(user)
    Friendship.where(sender_id: self.id, receiver_id: user.id).first
  end

  

# Carrierwave for Image
  mount_uploader :avatar, AvatarUploader
end
