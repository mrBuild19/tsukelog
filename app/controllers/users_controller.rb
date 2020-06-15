class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    # @users = User.where.not(id: current_user)
    # @search = User.ransack(params[:q])
    @search = User.where.not(id: current_user).ransack(params[:q])
    @users =  @search.result
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

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
