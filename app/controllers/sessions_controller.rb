class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      flash[:success] = "Hello #{user.username}!"
      redirect_to user_path(user)
    else
      flash.now[:danger] = "Sorry. Please enter valid credentials."
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end
end