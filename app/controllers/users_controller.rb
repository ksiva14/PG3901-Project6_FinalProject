class UsersController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  $studentUsers = "";
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
    @user = User.new
  end

  # GET /students/1/edit
  def edit
    @teams = Team.all
  end

  # POST /students
  # POST /students.json
  def create
    @user = User.new(user_params)
    if @user.save

    else
        render 'newStudent'
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
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
   
    $studentUsers = User.where("email LIKE ?", params[:q])
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
