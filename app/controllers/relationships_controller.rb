class RelationshipsController < ApplicationController
	before_action :authenticate_user!
	before_action :admin_limit

	def follow
		current_user.follow(params[:id])
		redirect_back(fallback_location: user_path(params[:id]))
	end
	def unfollow
		current_user.unfollow(params[:id])
		redirect_back(fallback_location: user_path(params[:id]))
	end

	private
	def admin_limit
		if current_user.admin?
			flash[:alert] = "管理者ユーザーはフォローできません。"
    		redirect_back(fallback_location: posts_path)
    	end
  	end
end