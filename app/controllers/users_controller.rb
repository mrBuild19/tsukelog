class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user, only: :destroy

  def index
    @users =  User.where.not(admin: true).page(params[:page]).per(3)
  end

  def show
  	@user = User.find(params[:id])
    @my_posts =  @user.posts.order(created_at: "DESC").page(params[:page]).per(3)
    @follow_users = @user.following_user.page(params[:page]).per(3)
    @follower_users = @user.followers_user.page(params[:page]).per(3)
    @like_posts = @user.likes.page(params[:page]).per(3)
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to user_path(@user)
		else
			render :edit
		end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    flash[:notice] = "#{user.name}さんを削除しました。"
    redirect_back(fallback_location: users_path)
  end

  def search
    @search = User.where.not(admin: true).ransack(params[:q])
    @search_users =  @search.result.page(params[:page])
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  def admin_user
    redirect_to users_path unless current_user.admin?
  end
end
