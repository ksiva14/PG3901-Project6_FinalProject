class StaticPagesController < ApplicationController
  def dashboard
    @user = current_user
    # each user can be students in many diff course
    @students = @user.students
  end

  def view_evaluations
    @for_student = Student.find(params[:for_student])
    @project = Project.find(params[:project_id])
  end
end
