class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: session_params[:email])
    if user && user.authenticate(session_params[:password])
      session[:user_id] = user.id 
      flash[:success] = "Successfully logged in."
      redirect_to root_path
    else
      flash[:danger] = "Sorry, incorrect entry, try again."
      render :new
    end
  end

  def destroy
    session.clear
    flash[:success] = "Logged Out"
    redirect_to root_path
  end

  def session_params
    params.require(:session).permit(:email, :password)
  end
end