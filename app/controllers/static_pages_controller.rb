class StaticPagesController < ApplicationController
  $project_id = 1
  def dashboard
    @user = User.find(1)
    # each user can be students in many diff course
    @students = @user.students
  end
end
