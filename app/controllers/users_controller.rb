class UsersController < ApplicationController
  def index
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
      redirect_to root_path
    end
  end
  
  def search
   
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :username)
  end
end
