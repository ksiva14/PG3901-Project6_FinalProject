class StudentsController < ApplicationController
  before_action :set_student, only: %i[show edit update destroy]

  # GET /students
  # GET /students.json
  def index
    # all students of current user
    @students = Student.where(user_id: current_user.id)
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)
    # find user using their email
    student_users = User.where('email LIKE ?', params[:q].strip)
    # find user by name if couldnt find their email
    student_users = User.where('name LIKE ?', params[:q].strip) if student_users.empty?
    # update user_id
    @student.user_id = student_users[0].id unless student_users.empty?
    if !@student.user_id.nil? && @student.save
      flash[:success] = "#{@student.user.name} found. Please select a team for #{@student.user.name}."
      redirect_to navigation_courses_path(id: params[:course_id], found: 'success', student_id: @student.id,
                                          course_id: params[:course_id])
    else
      flash[:danger] =
        "Unable to find any user with an email of \"#{params[:q]}\" or with the name of \"#{params[:q]}\".
        Please enter their full email or full name"
      redirect_to navigation_courses_path(id: params[:course_id])
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    if @student.update(student_params_edit)
      student_list = @student.team.students.select do |student|
        User.all.find(student.user_id).email == User.all.find(@student.user_id).email
      end
      if student_list.length > 1
        team = Team.find(@student.team_id)
        team.students.find(@student.id).destroy
        flash[:danger] = "#{@student.user.name} already exists in #{team.team_name}."
        course_num = Team.all.find(@student.team_id).course_id.to_s
        redirect_to "/courses/navigation?id=#{course_num}"
      else
        team = Team.find(@student.team_id)
        flash[:success] = "#{@student.user.name} is successfully added to #{team.team_name}."
        redirect_to navigation_courses_path(id: @student.team.course.id)
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    case params[:from]
    when 'course'
      flash[:success] =
        "#{@student.user.name} was successfully removed from #{Course.find(params[:course_id]).course_name}."
      # remove all students of user from the course & team
      remove_from_course @student.user.id, params[:course_id]
      redirect_to navigation_courses_path(id: params[:course_id])
    when 'team'
      team_name = Team.find(@student.team_id).team_name
      student_name = User.find(@student.user_id).name
      flash[:success] = "#{student_name} was successfully removed from #{team_name}."
      # delete all evaluation by this student
      Evaluation.where(by_student: @student.id).destroy_all
      # delete all evaluation for this student
      Evaluation.where(for_student: @student.id).destroy_all
      @student.destroy
      redirect_to team_path(@student.team_id)
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
