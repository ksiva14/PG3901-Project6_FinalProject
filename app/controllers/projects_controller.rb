class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy]

  # GET /projects
  # GET /projects.json
  def index
    # get all projects for a particular course
    @projects = Project.all.where(course_id: params[:course_id])
    # create evaluations if not already created
    create_evaluations_for_all_project_teams(params[:course_id])
    professors = User.find(current_user.id).professors
    @courses = []
    professors.each do |professor|
      @courses << Course.find(professor.course_id) unless professor.course_id.nil?
    end
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)

    if @project.save
      flash[:success] = "#{@project.project_name} was successfully created."
      # redirects to the correct course project page
      redirect_to projects_url(course_id: @project.course_id)
    else
      flash[:danger] = "Project could not be created. #{@project.errors.full_messages[0]}"
      redirect_to projects_url(course_id: params[:course_id])
    end
  end

  def set_avg_score
    @evaluation = Evaluation.find_by(project_id: params[:project_id], team_id: params[:team_id],
                                     by_professor: true, for_student: params[:for_student])

    user = Student.find(params[:for_student]).user
    if params[:score].to_i <= 0
      flash[:danger] = "Average score for #{user.name} cannot be 0 or less."
    elsif params[:score].to_i > 10
      flash[:danger] = "Average score for #{user.name} cannot more than 10."
    elsif @evaluation.update(params.permit(:score))
      flash[:success] = "Average score for #{user.name} has been changed to #{params[:score]}."
    end
    redirect_to projects_url(course_id: params[:course_id])
  end

  def create_project_team
    @project_team = ProjectTeam.new(project_team_params)
    project = Project.find(@project_team.project_id)
    team = Team.find(@project_team.team_id)

    if ProjectTeam.find_by(project_id: project.id, team_id: team.id).present?
      # team added more than once to the same project
      flash[:danger] =  "Unable to add team. Team #{team.team_name} has already been added to #{project.project_name}."
    elsif @project_team.save
      # create evaluations for the team for this project
      helpers.create_evaluations_for_project(@project_team)
      flash[:success] = "#{team.team_name} was successfully added to #{project.project_name}."
    end
    redirect_to projects_url(course_id: project.course_id)
  end

  def update
    old_name = @project.project_name
    if @project.update(project_params)
      flash[:success] = "#{old_name} was successfully updated to #{@project.project_name}."
    end
    redirect_to projects_url(course_id: @project.course_id)
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    flash[:success] = "#{@project.project_name} was successfully deleted."
    course_id = @project.course_id
    # deletes all evaluations for this project
    Evaluation.where(project_id: @project.id).destroy_all
    @project.destroy
    redirect_to projects_url(course_id: course_id)
  end

  def remove_team
    project_team = ProjectTeam.find_by(project_id: params[:project_id], team_id: params[:team])
    team = Team.find(project_team.team_id)
    project = Project.find(project_team.project_id)
    flash[:success] = "#{team.team_name} was successfully removed from #{project.project_name}."
    # delete all evaluations related to this team in the project
    Evaluation.where(project_id: params[:project_id], team_id: params[:team]).destroy_all
    # remove team from project
    project_team.destroy
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
