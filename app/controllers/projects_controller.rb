class ProjectsController < ConsoleController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user

  def index
    @projects = current_user.projects
  end

  def show
  end

  def new
    @project = current_user.projects.new
  end

  def create
    @project = current_user.projects.new(project_params)
    if @project.save
      redirect_to @project, flash: { success: "Project created successfully!" }
    else
      render :new, status: :unprocessable_entity, flash: { error: "Failed to create project." }
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to @project, flash: { success: "Project updated successfully!" }
    else
      render :edit, status: :unprocessable_entity, flash: { error: "Failed to update project." }
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_url, flash: { success: "Project deleted successfully!" }
  end

  private

  def project_params
    params.require(:project).permit(:name)
  end

  def set_sidebar_partial
    @sidebar_partial = case action_name
                       when 'show'
                         'projects'
                       when 'edit'
                         'projects'
                       else
                         'default'
                       end
  end
end
