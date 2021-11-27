class SessionsController < ApplicationController
  def new
  end
  def create
    flash.now[:danger] = "test"
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      #Check if user is student
      if Student.find_by(user_id: user.id)
        #Route to Students Page
        #redirect_to student
      else
        #Else Route to Professors Page
        #redirect_to professor
      end
    else 
      #Display Invalid Flash Message
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
end
