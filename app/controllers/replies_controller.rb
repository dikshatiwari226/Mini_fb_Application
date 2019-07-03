class RepliesController < ApplicationController
	
	def index
		
	end

	def new
		
	end

	def create

		@post = Post.find(params[:post_id])
		@comment = Comment.find(params[:comment_id])
		@reply = @comment.replies.create!(reply_params)

		# redirect_to post_path(@post)
	end

	def destroy
		# byebug
		@post = Post.find(params[:post_id])
		@comment = Comment.find(params[:comment_id])
		@reply = @comment.replies.find(params[:id])
		@reply.destroy
		redirect_to post_path(@post)	
	end

	private
	def reply_params
		params.require(:reply).permit(:body, :user_id)
	end
end
