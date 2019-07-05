class FriendshipMailer < ApplicationMailer

	def send_request(friendship)
		@sender = User.find(friendship.sender_id)
		@receiver = User.find(friendship.receiver_id)
		mail(to: @receiver.email, subject: 'New Friend Request')
	end

	def accept_request(friendship)
		@sender = User.find(friendship.sender_id)
		@receiver = User.find(friendship.receiver_id)
		mail(to: @sender.email, subject: ' Request Accepted')
	end

	def reject_request(friendship)
		@sender = User.find(friendship.sender_id)
		@receiver = User.find(friendship.receiver_id)
		mail(to: @sender.email, subject: ' Request Rejected')
	end

end