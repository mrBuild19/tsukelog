class PostsController < ApplicationController

  def index
    # フォローユーザーの投稿取得
    follow_users = current_user.following_user
    @follow_posts = Post.where(user_id: follow_users).page(params[:page]).order(created_at: "DESC")
    # 新着順で投稿取得
    @arrival = Post.page(params[:page]).order(created_at: "DESC")
    # 人気順で投稿取得
    @popular = Post.page(params[:page]).left_joins(:likes).group('posts.id').order('count(likes.post_id) DESC')
  end

  def new
  	@post = Post.new
  	@post.post_images.build
  end

  def create
  	post = Post.new(post_params)
  	post.user_id = current_user.id
  	post.save
  	redirect_to posts_path, notice: "登録しました。"
  end

  def show
  	@post = Post.find(params[:id])
    @comment = PostComment.new
  end

  def edit
  	@post = Post.find(params[:id])
  end

  def update
  	post = Post.find(params[:id])
  	post.update(post_params)
  	redirect_to post_path(post), notice: "投稿を更新しました。"
  end

  def destroy
  	post = Post.find(params[:id])
  	post.destroy
  	redirect_to posts_path, notice: "投稿を削除しました。"
  end

  private
  def post_params
    params.require(:post).permit(:title, :text, :tag_list, post_images_post_images: [])
  end
end
