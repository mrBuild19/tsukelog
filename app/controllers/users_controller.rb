class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users =  User.page(params[:page]).per(3)
  end

  def show
  	@user = User.find(params[:id])
    @my_posts =  @user.posts.page(params[:page]).order(created_at: "DESC")
    @follow_users = @user.following_user.page(params[:page])
    @follower_users = @user.followers_user.page(params[:page])
    @like_posts = @user.likes.page(params[:page])
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

  def search
    @search = User.ransack(params[:q])
    @search_users =  @search.result.page(params[:page])
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
