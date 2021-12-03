class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy]

  # GET /projects
  # GET /projects.json
  def index
    # get all projects for a particular course
    @projects = Project.all.where(course_id: params[:course_id])
    # create evaluations if not already created
    helpers.create_evaluations_for_all_project_teams(params[:course_id])
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
      end
    end
  end

  def create_project_team
    @project_team = ProjectTeam.new(project_team_params)

    respond_to do |format|
      if @project_team.save
        project = Project.find(@project_team.project_id)
        # create evaluations for the team for this project
        helpers.create_evaluations_for_project(@project_team)
        format.html do
          redirect_to projects_url(course_id: project.course_id), notice: 'Team was successfully added to project.'
        end
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    course_id = @project.course_id
    # deletes all evaluations for this project
    Evaluation.where(project_id: @project.id).destroy_all
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url(course_id: course_id), notice: 'Project was successfully destroyed.' }
      # format.json { head :no_content }
    end
  end

  def remove_team
    # delete all evaluations related to this team in the project
    Evaluation.where(project_id: params[:project_id], team_id: params[:team]).destroy_all
    # remove team from project
    ProjectTeam.find_by(project_id: params[:project_id], team_id: params[:team]).destroy

    redirect_to projects_url(course_id: params[:course_id])
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

  # Only allow a list of trusted parameters through.
  def project_team_params
    params.permit(:project_id, :team_id)
  end
end
