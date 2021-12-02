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
    # Student.all.where(user_id: @student.user_id, team_id: nil).destroy_all
    # @users = User.all
    # remove all instances of $studentUsers
    $studentUsers = User.where('email LIKE ?', params[:q])
    @student.user_id = $studentUsers[0].id unless $studentUsers[0].nil?
    $courseID = params[:course_id]
    if !@student.user_id.nil? && @student.save
      # edit_student_path
      # redirect_link = "/students/#{@student.id}/edit?course_id=#{params[:course_id]}"
      # redirect_to redirect_link, notice: 'Student was successfully created.'
      redirect_to navigation_courses_path(id: params[:course_id], found: 'success', student_id: @student.id,
                                          course_id: params[:course_id]), notice: 'User found. Please select a team.'
    else
      redirect_to navigation_courses_path(id: params[:course_id]), notice: 'No user with that email was found.'
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params_edit)
        format.html do
          redirect_to navigation_courses_path(id: @student.team.course.id), notice: 'Student was successfully added.'
        end
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
    # remove all students of user from the course/team
    case params[:from]
    when 'course'
      course_id = Team.all.find(@student.team_id).course_id
      helpers.remove_from_course @student.user_id, course_id
      redirect_to navigation_courses_path(id: course_id), notice: 'Student was successfully removed.'
    when 'team'
      @student.destroy
      redirect_to team_path(@student.team_id), notice: 'Student was successfully removed.'
    end
  end

  # def search
  #   $studentUsers = User.where('email LIKE ?', params[:q])
  # end

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
