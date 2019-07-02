class LikesController < ApplicationController
	# before_action :find_post
	before_action	:find_like, only:[:destroy]
	def create
		if current_user.likes.where(likeable_id: params[:likeable_id], likeable_type: params[:likeable_type]).exists?
			flash[:notice]= "you can't like more than once"
		else
			@like = current_user.likes.create(likeable_id: params[:likeable_id], likeable_type: params[:likeable_type])
		end
	end

	def destroy
		@like.destroy
	end

	def find_like
		@like = Like.find(params[:id])
	end

	# private
	# def find_post
	# 	@post = Post.find(params[:post_id])
	# end
end
