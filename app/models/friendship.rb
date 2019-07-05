class Friendship < ApplicationRecord
	STATUS = {1 => 'Pending', 2 => 'Accepted', 3 => 'Rejected'}

	after_create :send_request_mail

	def status
		STATUS[self.status_id]
	end

	def send_request_mail
		FriendshipMailer.send_request(self).deliver
	end

end
