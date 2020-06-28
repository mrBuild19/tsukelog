class RelationshipsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_user
	before_action :admin_limit

	def follow
		current_user.follow(@user.id) if current_user != @user
	end
	def unfollow
		current_user.unfollow(@user.id)
	end

	private
	def set_user
  		@user = User.find(params[:id])
  	end
	def admin_limit
		if current_user.admin?
			flash[:alert] = "管理者ユーザーはフォローできません。"
    		redirect_back(fallback_location: posts_path)
    	end
  	end
end