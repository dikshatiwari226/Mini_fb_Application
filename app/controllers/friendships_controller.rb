class FriendshipsController < ApplicationController
	def new
		
	end

	def index
		@users = User.where.not(id: current_user.id)
	end

	def show
		@user = User.find(params[:id])
	end

	def accept
    	@friendship = Friendship.where(sender_id: params[:id], receiver_id: current_user.id).first
    	if @friendship.present?
    		@friendship.update(status_id: 2)
    		FriendshipMailer.accept_request(@friendship).deliver
    	end
		redirect_back(fallback_location: root_path)
  	end

  	def reject
    	@friendship = Friendship.where(sender_id: params[:id], receiver_id: current_user.id).first
    	if @friendship.present?
    		@friendship.update(status_id: 3)
    		FriendshipMailer.reject_request(@friendship).deliver
    	end
		redirect_back(fallback_location: root_path)
  	end

	def send_request
		Friendship.create(sender_id: current_user.id, receiver_id: params[:id])
    	redirect_back(fallback_location: root_path)
	end

	private
	def friends_params
		params.require(:friendship).permit(:sender_id, :receiver_id, :status_id)
	end
end
