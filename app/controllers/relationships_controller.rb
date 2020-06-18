class RelationshipsController < ApplicationController
	def follow
		current_user.follow(params[:id])
		redirect_back(fallback_location: user_path(params[:id]))
	end

	def unfollow
		current_user.unfollow(params[:id])
		redirect_back(fallback_location: user_path(params[:id]))
	end
end
