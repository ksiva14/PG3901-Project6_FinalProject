class TeamsController < ApplicationController
  before_action :set_team, only: %i[show edit update destroy]
  $currentCourse = 0

  # GET /teams
  # GET /teams.json
  def index
    @teams = Team.all
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
    studentIDs = Student.all.select { |student| student.team_id == @team.id }
    @teamMembers = []
    @students = Student.all
    @users = User.all
    studentIDs.each do |student|
      @teamMembers << User.all.find(student.user_id)
    end
    @courses = Course.all
  end

  # GET /teams/1/edit
  def edit; end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(team_params)
    respond_to do |format|
      if @team.save
        format.html do
          redirect_to navigation_courses_url(id: @team.course_id), notice: 'Team was successfully created.'
        end
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    indices = []
    Student.all.each do |student|
      indices << student.id if student.team_id == @team.id
    end

    indices.each do |studentID|
      Student.all.find(studentID).destroy
    end
    redirectLink = '/courses/' + @team.course_id.to_s + '/course_navigation'
    @team.destroy

    respond_to do |format|
      format.html { redirect_to redirectLink, notice: 'Team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_team
    @team = Team.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def team_params
    # TODO: error with param.require(:team)
    # params.require(:teams).permit(:team_name, :course_id)
    params.permit(:team_name, :course_id)
  end
end
