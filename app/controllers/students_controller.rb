class StudentsController < ApplicationController
  before_action :set_student, only: %i[show edit update destroy]
  $studentUsers = ''
  $courseID = 0
  # GET /students
  # GET /students.json
  def index
    @students = Student.all
    @teams = Team.all
    @users = User.all
  end

  # GET /students/1
  # GET /students/1.json
  def show
    @teams = Team.all
    @users = User.all
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
    @teams = Team.all
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)

    @users = User.all
    @student.user_id = $studentUsers[0].id
    @student.team_id = -1

    respond_to do |format|
      if @student.save
        redirectLink = '/students/' + @student.id.to_s + '/edit'
        format.html { redirect_to redirectLink, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params_edit)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    course_id = Team.all.find(@student.team_id).course_id

    # remove all students of user from the course/team
    if params[:from] == 'course'
      Student.where(user_id: @student.user_id).each do |student|
        student.destroy if student.team.course.id == course_id
      end
      respond_to do |format|
        format.html { redirect_to navigation_courses_path(id: course_id), notice: 'Student was successfully removed.' }
        # format.json { head :no_content }
      end
    elsif params[:from] == 'team'
      @student.destroy
      respond_to do |format|
        format.html { redirect_to team_path(@student.team_id), notice: 'Student was successfully removed.' }
        # format.json { head :no_content }
      end
    end
  end

  def search
    $studentUsers = User.where('email LIKE ?', params[:q])
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_student
    @student = Student.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def student_params
    params.permit(:user_id, :team_id)
  end

  # Only allow a list of trusted parameters through.
  def student_params_edit
    params.require(:student).permit(:user_id, :team_id)
  end
end
