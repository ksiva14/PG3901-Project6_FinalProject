class EvaluationsController < ApplicationController
  before_action :set_evaluation, only: %i[edit update destroy]

  # GET /evaluations
  # GET /evaluations.json
  def index
    @project = Project.find(params[:project_id])
    @by_student = Student.find(params[:by_student])
    @teammates = Team.find(@by_student.team_id).students.where.not(id: @by_student.id)
  end

  # GET /evaluations/new
  def new
    @for_student = Student.find(params[:for_student])
    @by_student = Student.find(params[:by_student])
    project_id = params[:project_id]

    @team = @by_student.team
    # Get the correct evaluation for the student for a particular project
    @evaluation = Evaluation.all.find_by team_id: @team.id, project_id: project_id,
                                         for_student: @for_student.id, by_student: @by_student.id
    @grading_scale = [
      {
        grade: '1-2',
        title: 'Poor team-mate',
        description: ['Did not contribute to the final product', 'Put forth little or insufficient effort',
                      'Was rarely present at team meetings and was difficult to get a hold of',
                      'You would **avoid partnering** with this person in a future course']
      }, {
        grade: '3-4',
        title: 'Fair team-mate',
        description: ['Worked hard at contributing to the project', 'Struggled to carry out assigned responsibilities',
                      'Made minor contributions to the final product', 'You would **prefer not to partner** with this person in a future course']
      }, {
        grade: '5-6',
        title: 'Good team-mate',
        description: ['Carried out their assigned responsibilities', 'Contributed to the final product',
                      'Room for improvement in communication, initiative, effort, or skills',
                      "You would be **willing to partner** with them in a future course, though you wouldn't seek them out"]
      }, {
        grade: '7-8',
        title: 'Very good team-mate',
        description: ['Contributed significantly', 'Communicated effectively',
                      'Took initiative in the design and implementation',
                      'You would **seek out** this person to be a team-mate in a future course']
      }, {
        grade: '9-10',
        title: 'Amazing team-mate',
        description: ['You will be in contact with them for years',
                      'One of the **best** team-mates you have ever had for any project']
      }
    ]
  end

  # PATCH/PUT /evaluations/1
  # PATCH/PUT /evaluations/1.json
  def update
    respond_to do |format|
      if @evaluation.update(evaluation_params)
        format.html do
          redirect_to evaluations_url(project_id: @evaluation.project_id, by_student: @evaluation.by_student),
                      notice: 'Evaluation was successfully updated.'
        end
      end
    end
  end

  # DELETE /evaluations/1
  # DELETE /evaluations/1.json
  def destroy
    @evaluation.destroy
    respond_to do |format|
      format.html do
        redirect_to evaluations_url(project_id: @evaluation.project_id, student_id: @evaluation.by_student),
                    notice: 'Evaluation was successfully destroyed.'
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_evaluation
    @evaluation = Evaluation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def evaluation_params
    params.require(:evaluation).permit(:project_id, :team_id, :for_student, :by_student, :score, :comment)
  end
end
