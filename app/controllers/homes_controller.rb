class HomesController < ApplicationController
	def top
		@posts =  Post.all.page(params[:page]).order(created_at: "DESC")
		@popular = Post.page(params[:page]).left_joins(:likes).group('posts.id').order('count(likes.post_id) DESC')
	end
end
