class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to root_url
    else
      render 'new'
    end
  end

  private
  def project_params
    params.require(:project).permit(:name, :description, :funding_goal, :start_date, :end_date)
  end
end
