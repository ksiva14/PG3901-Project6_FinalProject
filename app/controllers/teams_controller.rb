class TeamsController < ApplicationController
  before_action :set_team, only: %i[show edit update destroy]

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

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(team_params)

    if @team.save
      proposed_name = @team.team_name
      teams_with_name = Course.all.find(params[:id]).teams.where(team_name: proposed_name).length
      i = teams_with_name - 1
      while teams_with_name > 1
        @team.team_name = "#{proposed_name} (#{i})"
        i += 1
        teams_with_name = Course.all.find(@team.course_id).teams.where(team_name: @team.team_name).length + 1
      end
      @team.save
      flash[:success] = "#{@team.team_name} was successfully created"
    else
      flash[:danger] = "Team could not be created. #{@team.errors.full_messages[0]}"
    end
    redirect_to navigation_courses_url(id: params[:id])
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    old_name = @team.team_name
    if @team.update(team_params)
      flash[:success] = "#{old_name} was successfully updated to #{@team.team_name}."
    else
      flash[:danger] = "#{@team.team_name} could not be updated. #{@team.errors.full_messages}"
    end
    redirect_to navigation_courses_path(id: @team.course_id)
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team.destroy
    flash[:success] = "#{@team.team_name} was successfully destroyed."
    redirect_to '/courses/' + @team.course_id.to_s + '/course_navigation'
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
