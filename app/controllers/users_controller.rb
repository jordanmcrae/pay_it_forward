class UsersController < ApplicationController
  skip_before_filter :require_login, only: [:new, :create]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      redirect_to(:root, notice: 'User was successfully created.')
    else
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :user_name, :first_name, :last_name, :address, :password, :password_confirmation)
  end
end
