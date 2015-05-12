class UsersController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])

    # if current_user
    #   @comment = @project.comment.build
    # end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url
    else
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :user_name, :first_name, :last_name, :password, :password_confirmation)
  end
end
