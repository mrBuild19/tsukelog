class PostsController < ApplicationController
  before_action :authenticate_user!, except: :search
  before_action :admin_limit, only: [:new, :create]

  def index
    # フォローユーザーの投稿取得
    follow_users = current_user.following_user
    @timeline_posts = Post.where(user_id: follow_users).order(created_at: "DESC").
      page(params[:page]).per(3)
    # 新着順で投稿取得
    @arrival_posts = Post.order(created_at: "DESC").page(params[:page]).per(9)
    # 人気順で投稿取得
    @popular_posts = Post.left_joins(:likes).group('posts.id').order('count(likes.post_id) DESC').
      page(params[:page]).per(9)
  end

  def new
    @post = Post.new
    @post.post_images.build
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path, notice: "投稿しました。"
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments = PostComment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post), notice: "投稿を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    flash[:alert] = "投稿を削除しました。"
    if params[:admin].present?
      redirect_back(fallback_location: posts_path)
    else
      redirect_to posts_path
    end
  end

  def search
    @search = Post.ransack(params[:q])
    # タグ絞り込み処理
    if params[:tag_name]
      @search_posts = Post.tagged_with("#{params[:tag_name]}").order(created_at: "DESC").
        page(params[:page]).per(9)
    else
      @search_posts = @search.result.order(created_at: "DESC").page(params[:page]).per(9)
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :rate, :tag_list, post_images_images: [])
  end

  def admin_limit
    if current_user.admin?
      redirect_to posts_path, alert: "管理者ユーザーは新規投稿できません。"
    end
  end
end
