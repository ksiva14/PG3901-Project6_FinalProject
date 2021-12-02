class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy]

  # GET /projects
  # GET /projects.json
  def index
    # get all projects for a particular course
    @projects = Project.all.where(course_id: params[:course_id])
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html do
          redirect_to projects_url(course_id: @project.course_id), notice: 'Project was successfully created.'
        end
        # format.json { render :show, status: :created, location: @project }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    course_id = @project.course_id
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url(course_id: course_id), notice: 'Project was successfully destroyed.' }
      # format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Project.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def project_params
    params.require(:project).permit(:project_name, :course_id)
  end
end
