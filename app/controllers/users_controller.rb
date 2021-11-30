class UsersController < ApplicationController
  #before_action :set_student, only: [:show, :edit, :update, :destroy]

  # GET /students/new
  def newStudent
    @student = User.new
  end


  def newProfessor
    @professor = User.new
  end

  # POST /students
  # POST /students.json
  def createStudent
    @student = User.new(user_params)
    if @student.save
        flash[:success] = "Welcome: Login to Evaluation App!"
        redirect_to root_path
    else
        render 'newStudent'
    end
  end

  def createProfessor
    @professor = User.new(user_params)
    if @professor.save
        #Save professor details in professor table
        @prof = Professor.new
        @prof.user_id = @professor.id
        @prof.course_id = -1
        @prof.save
        #redirect
        flash[:success] = "Welcome: Login to Evaluation App!"
        redirect_to root_path
    else
        render 'newProfessor'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
    
end
