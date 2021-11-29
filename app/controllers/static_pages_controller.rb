class StaticPagesController < ApplicationController
  def dashboard
    @user = User.find(1)
    # each user can be students in many diff course
    @students = @user.students
  end

  def view
    student_id = params[:student_id]
    project_id = params[:project_id]

    @student = Student.find(student_id)
    @project = Project.find(project_id)
  end
end
