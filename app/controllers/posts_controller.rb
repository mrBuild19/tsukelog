class PostsController < ApplicationController

  def index
    @search = Post.ransack(params[:q])
    @tags = ActsAsTaggableOn::Tag.all

    # タグ絞り込み
    if params[:tag_name]
      @posts = Post.tagged_with("#{params[:tag_name]}")
    elsif @search
      @posts = @search.result
    else
      @posts = Post.all
    end
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
