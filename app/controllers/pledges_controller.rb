class PledgesController < ApplicationController
  def new
    @pledge = Pledge.new
  end
  def create
    reward  = Reward.find(params[:reward_id])
    project = Project.find(params[:project_id])
    @pledge  = Pledge.new(project: project, reward: reward, user: current_user)
    unless @pledge.save
      flash[:notice] = @pledge.errors
    end
    redirect_to project
  end
end
