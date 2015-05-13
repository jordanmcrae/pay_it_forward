class Admin::UsersController < ApplicationController
  before_filter :require_admin

  def require_admin
    unless.current_user.admin?
      redirect_to root_url, alert: "You are not allowed here."
    end
  end

  def index
  end

  def create

  end
end
