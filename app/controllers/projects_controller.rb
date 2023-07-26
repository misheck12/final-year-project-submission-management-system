class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.build(project_params)

    if @project.save
      flash[:success] = 'Project created successfully!'
      redirect_to @project
    else
      flash[:error] = 'Error creating project'
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @project.update(project_params)
      flash[:success] = "Project updated successfully!"
      redirect_to @project
    else
      flash[:error] = "Error updating project"
      render :edit
    end
  end

  def destroy
    @project.teams.clear # Remove association between project and teams
    @project.destroy
  
    flash[:success] = "Project deleted successfully!"
    redirect_to projects_path
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description, :goals, :deadline, :document)
  end
end
