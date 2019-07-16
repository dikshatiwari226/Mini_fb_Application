class Conversation < ApplicationRecord
	has_many	:messages, dependent: :destroy
	belongs_to 	:sender, foreign_key: :sender_id, class_name: 'User'
	belongs_to	:receiver, foreign_key: :receiver_id, class_name: 'User'

	validates :sender_id, uniqueness: {scope: :receiver_id}

	scope :between, -> (sender_id, receiver_id) do
    where(sender_id: sender_id, receiver_id: receiver_id).or(
      where(sender_id: receiver_id, receiver_id: sender_id)
    )
  end

  def self.get(sender_id, receiver_id)
    conversation = between(sender_id, receiver_id).first
    return conversation if conversation.present?

    create(sender_id: sender_id, receiver_id: receiver_id)
  end

	def opposed_user(user)
		user = receiver
    # user == receiver ? sender : receiver
	end
end
