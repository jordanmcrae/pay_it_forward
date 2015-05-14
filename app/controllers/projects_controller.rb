class ProjectsController < ApplicationController
  skip_before_filter :require_login, only: [:show, :index]
  # Allows all users to see all projects and specific projects. From the sorcery gem.
  def new
    @project = Project.new
  end

  def index
   @projects = if params[:search]
      Project.where("LOWER(name) LIKE LOWER(?)", "%#{params[:search]}%")
    else
      Project.all
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def create
    # current_user.projects.build(project_params) is the same as the two lines below.
    @project = Project.new(project_params)
    @project.image = params[:file]

    @project.user_id = current_user.id
    if @project.save
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
      redirect_to project_path(@project)
    else
      render 'edit'
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to root_url
  end

  private
  def project_params
    params.require(:project).permit(:name, :description, :funding_goal, :start_date, :end_date, :image, rewards_attributes: [:title, :description, :amount, :backer_limit])
  end
end
