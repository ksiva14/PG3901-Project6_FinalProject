class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  $currentCourse = 0;
  # GET /teams
  # GET /teams.json
  def index
    @teams = Team.all
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
    studentIDs = Student.all.select{ |student| student.team_id == @team.id }
    @teamMembers = []
    @students = Student.all
    @users = User.all
    studentIDs.each {|student| 
      @teamMembers << User.all.find(student.user_id)
    }
    @courses = Course.all

  end

  # GET /teams/new
  def new
    @team = Team.new
    @team.course_id = params[:id]
  end

  # GET /teams/1/edit
  def edit
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(team_params)
    @team.course_id = $currentCourse
    respond_to do |format|
      if @team.save
        format.html { redirect_to @team, notice: 'Team was successfully created.' }
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
    Student.all.each { |student|
    indices << student.id if (student.team_id == @team.id)
    }

    indices.each {|studentID|
      Student.all.find(studentID).destroy
    }
    redirectLink =  "/courses/" + @team.course_id.to_s + "/course_navigation" 
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
      params.require(:team).permit(:team_name, :course_id)
    end
end
