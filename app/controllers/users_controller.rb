class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def edit
    authorize! @user
  end

  def create
    @user = User.new(user_params)
    respond_with @user
  end

  def update
    authorize! @user
    @user.update(user_params)
    respond_with @user
  end

  def destroy
    authorize! @user
    @user.destroy
    respond_with @user
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :encrypted_password, :password)
  end
end
