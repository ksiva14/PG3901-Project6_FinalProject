class CoursesController < ApplicationController
  before_action :set_course, only: %i[update destroy]

  # GET /courses
  # GET /courses.json
  def index
    @courses = User.find(current_user.id).professors.all
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)
    @user = User.find(current_user.id)

    respond_to do |format|
      if @course.save
        # tag professor to a new course
        Professor.create user_id: current_user.id, course_id: @course.id
        # delete all professor for this user without a course_id
        @user.professors.all.where(course_id: nil).destroy_all
        format.html { redirect_to courses_url, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        # create fails. likely to do with model validation
        # format.html { render :new }
        # format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to courses_url, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        # update fails. likely to do with model validation
        # format.html { render :edit }
        # format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def navigation
    # @courseID = params[:id]
    @course = Course.find(params[:id])
    @teams = Team.all.where(course_id: @course.id)
    # checks if there is any teams for the course
    if @teams.present? && @students.present?
      @students = Student.all.select do |student|
        if student.team_id != -1
          Team.all.find(student.team_id).course_id == @course.id
        else
          false
        end
      end
      @users = User.all
    end
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
