class EvaluationsController < ApplicationController
  before_action :set_evaluation, only: %i[show edit update destroy]

  # GET /evaluations
  # GET /evaluations.json
  def index
    @project_id = params[:project_id]
    student_id = params[:student_id]
    team_id = Student.find(student_id).team_id

    @teammates = Student.find(student_id).team.students.where.not(id: student_id)
    # Create a blank evaluation for each student in the team
    # TODO: create evaluations when the project is created!
    @teammates.each do |student|
      # do not create evaluation for yourself
      # check if evaluation is already created
      next unless Student.find(student_id) != student && Evaluation.all.find_by(project_id: @project_id, team_id: team_id,
                                                                                for_student: student.id, by_student: student_id).nil?

      Evaluation.create project_id: @project_id, team_id: team_id,
                        for_student: student.id, by_student: student_id, score: nil, comment: nil, is_assigned: true
    end
    finished = true
    Evaluation.where(project_id: @project_id, team_id: team_id, by_student: student_id).each do |evaluation|
      finished = false if evaluation.nil?
    end

    # Project.find(@project_id).assigned = true if finished
  end

  # GET /evaluations/new
  def new
    # Get student_id from url
    student_id = params[:student_id]
    team_id = Student.find(student_id).team_id
    @project_id = params[:project_id]

    # Pass @student to /new (allow usage in _form.html)
    @student = Student.find(student_id)
    # Pass @evaluation, @team, @grading_scale to /new (allow usage in new.html)
    @team = @student.team
    # Get the correct evaluation for the student for a particular project
    @evaluation = Evaluation.all.find_by team_id: team_id, for_student: student_id, project_id: @project_id
    # TODO: rmb to change to correct project as well
    @grading_scale = [
      {
        grade: '1',
        title: 'Poor team-mate',
        description: ['Did not contribute to the final product', 'Put forth little or insufficient effort',
                      'Was rarely present at team meetings and was difficult to get a hold of',
                      'You would **avoid partnering** with this person in a future course']
      }, {
        grade: '2',
        title: 'Fair team-mate',
        description: ['Worked hard at contributing to the project', 'Struggled to carry out assigned responsibilities',
                      'Made minor contributions to the final product', 'You would **prefer not to partner** with this person in a future course']
      }, {
        grade: '3',
        title: 'Good team-mate',
        description: ['Carried out their assigned responsibilities', 'Contributed to the final product',
                      'Room for improvement in communication, initiative, effort, or skills',
                      "You would be **willing to partner** with them in a future course, though you wouldn't seek them out"]
      }, {
        grade: '4',
        title: 'Very good team-mate',
        description: ['Contributed significantly', 'Communicated effectively',
                      'Took initiative in the design and implementation',
                      'You would **seek out** this person to be a team-mate in a future course']
      }, {
        grade: '5',
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
        # format.html { redirect_to evaluations_url, notice: 'Evaluation was successfully updated.' }
        format.html do
          redirect_to evaluations_url(project_id: @evaluation.project_id, student_id: @evaluation.by_student),
                      notice: 'Evaluation was successfully updated.'
        end
        format.json { render :index, status: :ok, location: @evaluation }
      else
        format.html { render :edit }
        format.json { render json: @evaluation.errors, status: :unprocessable_entity }
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
      format.json { head :no_content }
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
