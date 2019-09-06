class UsersController < ApplicationController

  def index
    if params[:email]
      @user = User.search_by_email(params[:email])
    elsif params[:name]
      @user = User.search_by_name(params[:name])
    elsif params[:username]
      @user = User.search_by_username(params[:username])
    else
      @users = User.all
    end
    
      @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Account successfully created!"
      log_in(@user)
      redirect_to user_path(@user)
    else
      flash[:danger] = "Woops! Try again!"
      render :new
    end
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      flash[:success] = "User successfully updated!"
      redirect_to users_path
    else
      flash[:danger] = "Woops!. Try again!"
      render :edit
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    if @user.destroy
      flash[:success] = "User successfully removed!"
      session[:user_id] = nil
      redirect_to root_path
    end
  end
  
  def my_friends
    @friendships = current_user.friends
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :username, :search)
  end
end
