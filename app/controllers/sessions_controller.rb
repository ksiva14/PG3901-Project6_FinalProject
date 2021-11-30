class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    # creates a student that is not added to any course
    Student.create user_id: user.id
    if user && user.authenticate(params[:session][:password])
      log_in user
      # Check if user is student
      if Student.find_by(user_id: user.id)
        # Route to Students Dashboard
        redirect_to student_dashboard_path
      elsif Professor.find_by(user_id: user.id)
        # Else Route to Professors Page
        # redirect_to students_path
      end
    else
      # Display Invalid Flash Message
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
