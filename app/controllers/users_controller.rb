class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
  	@user = User.find(params[:id])
  end

  def edit
  end

  private
  def user_params
    params.require(:user).permit(:introduction, :profile_image)
  end
end
