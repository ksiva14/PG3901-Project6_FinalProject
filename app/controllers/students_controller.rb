class StudentsController < ApplicationController
  before_action :set_student, only: %i[show edit update destroy]

  # GET /students
  # GET /students.json
  def index
    @students = Student.all
    @teams = Team.all
    @users = User.all
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)
    # find user using their email
    student_users = User.where('email LIKE ?', params[:q])
    @student.user_id = student_users[0].id unless student_users[0].nil?
    # remove all student without a team
    Student.all.where(user_id: @student.user_id, team_id: nil).destroy_all
    if !@student.user_id.nil? && @student.save
      redirect_to navigation_courses_path(id: params[:course_id], found: 'success', student_id: @student.id,
                                          course_id: params[:course_id]), notice: 'User found. Please select a team.'
    else
      redirect_to navigation_courses_path(id: params[:course_id]), notice: 'No user with that email was found.'
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    if @student.update(student_params_edit) 
      stuList = @student.team.students.select{ |student| User.all.find(student.user_id).email == User.all.find(@student.user_id).email}
      if stuList.length > 1
          Team.all.find(@student.team_id).students[0].destroy
          courseNum = Team.all.find(@student.team_id).course_id.to_s
          redirect_to "/courses/navigation?id=" + courseNum , notice: 'User already exists in team.'
      else
        redirect_to navigation_courses_path(id: @student.team.course.id), notice: 'Student was successfully added.'
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
