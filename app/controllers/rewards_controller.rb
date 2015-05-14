class RewardsController < ApplicationController
  def show
    @reward = Reward.find(params[:id])
  end

  def new
    @reward = Reward.new
  end

  def create
    @reward = Reward.new(reward_params)
  end

  def edit
    @reward = Reward.find(params[:id])
  end

  def update
  @reward = Reward.find(params[:id])

    if @reward.update_attributes(reward_params)
      redirect_to reward_path(@reward)
    else
      render :edit
    end
  end

  def destroy
    @reward = Reward.find(params[:id])
    @reward.destroy
    redirect_to root_url
  end

  private
  def reward_params
    params.require(:reward).permit(:title, :description, :amount, :backer_limit)
  end
end
