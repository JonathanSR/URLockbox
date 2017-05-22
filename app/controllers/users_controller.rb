class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Successfully created account!"
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash.now[:error] = @user.errors.full_messages.join('. ')
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end