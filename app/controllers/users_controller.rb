class UsersController < ApplicationController
  expose :user
  expose :users
  # expose_decorated :user
  # expose_decorated :users

  def new
    User.new
  end

  def edit
    authorize! user
  end

  def create
    user = User.new(user_params)
    respond_with user
  end

  def update
    authorize! user
    user.update(user_params)
    respond_with user
  end

  def destroy
    authorize! user
    user.destroy
    respond_with user
  end

  private

  def user_params
    params.require(:user).permit(:email, :encrypted_password, :password)
  end
end
