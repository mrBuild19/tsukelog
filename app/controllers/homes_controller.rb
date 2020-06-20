class HomesController < ApplicationController
	def top
	# 新着順で投稿取得
    @arrival_posts = Post.order(created_at: "DESC").page(params[:page]).per(3)
    # 人気順で投稿取得
    @popular_posts = Post.left_joins(:likes).group('posts.id').order('count(likes.post_id) DESC').page(params[:page]).per(3)
	end
end
