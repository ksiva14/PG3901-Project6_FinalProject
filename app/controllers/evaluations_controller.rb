class EvaluationsController < ApplicationController
  before_action :set_evaluation, only: %i[show edit update destroy]

  # TODO: change to the correct id
  @@project_id = 3
  @@student_id = 3

  # GET /evaluations
  # GET /evaluations.json
  def index
    @evaluations = Evaluation.all
    @student = Student.find(@@student_id)
    @team = @student.team
    @teammates = @team.students

    @teammates.each do
    end
  end

  # GET /evaluations/1
  # GET /evaluations/1.json
  def show; end

  # GET /evaluations/new
  def new
    @evaluation = Evaluation.new
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
    # TODO: change Student.find(1) to the current student that logged in
    @student = Student.find(@@student_id)
    @team = @student.team
  end

  # GET /evaluations/1/edit
  def edit; end

  # POST /evaluations
  # POST /evaluations.json
  def create
    @evaluation = Evaluation.new(evaluation_params)
    # TODO: change student_id
    # TODO: change project_id
    # set value to add to database
    @evaluation[:student_id] = @@student_id
    @evaluation[:project_id] = @@project_id
    # render 'evaluations/new'
    respond_to do |format|
      if @evaluation.save
        format.html { redirect_to @evaluation, notice: 'Evaluation was successfully created.' }
        format.json { render :show, status: :created, location: @evaluation }
      else
        format.html { render :new }
        format.json { render json: @evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /evaluations/1
  # PATCH/PUT /evaluations/1.json
  def update
    respond_to do |format|
      if @evaluation.update(evaluation_params)
        format.html { redirect_to @evaluation, notice: 'Evaluation was successfully updated.' }
        format.json { render :show, status: :ok, location: @evaluation }
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
      format.html { redirect_to evaluations_url, notice: 'Evaluation was successfully destroyed.' }
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
    params.require(:evaluation).permit(:project_id, :student_id, :score, :comment)
  end
end
