class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :search]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :admin_user, only: :destroy
  before_action :check_guest, only: :destroy

  def index
    if user_signed_in?
      @users =  User.where.not(id: current_user.id, admin: true).page(params[:page]).per(9)
    else
      @users =  User.where.not(admin: true).page(params[:page]).per(9)
    end
  end

  def show
    @my_posts =  @user.posts.order(created_at: "DESC").page(params[:page]).per(3)
    @follow_users = @user.following_user.page(params[:page]).per(3)
    @follower_users = @user.followers_user.page(params[:page]).per(3)
    @like_posts = @user.likes.page(params[:page]).per(3)
  end

  def edit
    if @user.admin?
      flash[:alert] = "管理者ユーザーはプロフィール編集できません。"
      redirect_back(fallback_location: users_path)
    end
  end

  def update
		if @user.update(user_params)
			redirect_to user_path(@user), notice: "ユーザー情報を更新しました。"
		else
			render :edit
		end
  end

  def destroy
    @user.destroy
    flash[:alert] = "#{@user.name}さんを削除しました。"
    redirect_back(fallback_location: users_path)
  end

  def search
    if user_signed_in?
      @search = User.where.not(id: current_user.id, admin: true).ransack(params[:q])
    else
      @search = User.where.not(admin: true).ransack(params[:q])
    end
    @search_users =  @search.result.page(params[:page])
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def admin_user
    redirect_to(users_path) unless current_user.admin?
  end

  def check_guest
    if @user.email == "guest_user@gmail.com"
      redirect_to posts_path, alert: "ゲストユーザーは削除できません。"
    end
  end
end
