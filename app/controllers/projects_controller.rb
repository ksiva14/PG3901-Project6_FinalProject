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
        # create blank evaluations for each student in the course.
        Course.find(@project.course_id).teams.each do |team|
          Student.where(team_id: team.id).each do |by_student|
            Student.where(team_id: team.id).where.not(id: by_student.id).each do |for_student|
              # do not create the evaluation if it is already created
              next unless Evaluation.all.find_by(project_id: @project.id, team_id: team.id, for_student: for_student.id,
                                                 by_student: by_student.id).nil?

              Evaluation.create project_id: @project.id, team_id: team.id, for_student: for_student.id,
                                by_student: by_student.id, score: nil, comment: nil, is_assigned: true
            end
          end
        end
        format.html do
          redirect_to projects_url(course_id: @project.course_id), notice: 'Project was successfully created.'
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
