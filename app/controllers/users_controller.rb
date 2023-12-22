class UsersController < ApplicationController

  before_action :authenticate_user!

  def index
    redirect_to '/403.html' unless current_user.admin?
    @users = User.all.includes(:user_role)
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_url, notice: "Updated User."
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy if @user
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :locale, :password, :password_confirmation, :user_role_id)
  end

end