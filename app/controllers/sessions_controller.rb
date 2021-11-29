class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      #Check if user is student
      if Student.find_by(user_id: user.id)
        #Route to Students Page
        #redirect_to student
      elsif Professor.find_by(user_id: user.id)
        #Else Route to Professors Page
        redirect_to students_path
      else
        #redirect_to 
      end
    else 
      #Display Invalid Flash Message
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
