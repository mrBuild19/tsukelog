class LikesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_post
	before_action :admin_limit

	def create
		if current_user != @post.user
			like = current_user.likes.new(post_id: @post.id)
			like.save
		end
	end
	def destroy
		like = current_user.likes.find_by(post_id: @post.id)
		like.destroy
	end

	private
	def set_post
		@post = Post.find(params[:post_id])
	end
	def admin_limit
    	redirect_back(fallback_location: posts_path) if current_user.admin?
  	end
end
