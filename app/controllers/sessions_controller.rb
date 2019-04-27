class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Hello #{user.username}!"
      redirect_to user_path(user)
    else
      flash[:danger] = "Sorry. Please enter valid credentials."
      render :new
    end
  end

  def destroy
  end
end
