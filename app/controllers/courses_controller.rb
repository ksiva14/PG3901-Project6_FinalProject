class CoursesController < ApplicationController
  before_action :set_course, only: %i[update destroy]

  # GET /courses
  # GET /courses.json
  def index
    professors = User.find(current_user.id).professors
    @courses = []
    professors.each do |professor|
      @courses << Course.find(professor.course_id) unless professor.course_id.nil?
    end
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)
    @user = User.find(current_user.id)

    if @course.save
      # tag professor to a new course
      Professor.create user_id: current_user.id, course_id: @course.id
      # delete all professor for this user without a course_id
      @user.professors.all.where(course_id: nil).destroy_all
      flash[:success] = "Course #{@course.course_name} was successfully created."
    else
      # create fails
      flash[:danger] = "Course could not be created. #{@course.errors.full_messages[0]}"
    end
    redirect_to courses_url
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    old_name = @course.course_name
    if @course.update(course_params)
      flash[:success] = "#{old_name} was successfully updated to #{@course.course_name}."
    else
      flash[:danger] = "#{@course.course_name} could not be updated. #{@course.errors.full_messages[0]}"
    end
    redirect_to courses_url
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    flash[:success] = "#{@course.course_name} was successfully deleted."
    @course.destroy
    redirect_to courses_url
  end

  def navigation
    # @team = Team.new
    @course = Course.find(params[:id])
    @teams = Team.all.where(course_id: @course.id)
    # get students in the course
    @students = []
    Course.find(@course.id).teams.all.each do |team|
      team.students.each do |student|
        @students << student
      end
    end
    # create evaluations if not already created
    create_evaluations_for_all_project_teams(params[:id])
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_course
    @course = Course.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def course_params
    params.require(:course).permit(:course_num, :course_name)
  end
end
