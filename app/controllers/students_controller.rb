class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  $studentUsers = "";
  @@newStudent = 1;
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
    @@newStudent = 1;
    @student = Student.new(student_params)
    @@newStudent = 0
    @users = User.all
    @student.user_id = $studentUsers[0].id
    @student.team_id = -1;
    

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
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
