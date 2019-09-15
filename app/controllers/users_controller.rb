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
    @friendships = @user.friends
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
  
  def search_users
    if params[:potential_friend].blank?
      flash.now[:danger] = "Field cannot be blank"
      render 'users/my_friends'
    else
      @users = User.search(params[:potential_friend])
      flash.now[:danger] = "User not found" if @users.blank?
      render 'users/my_friends'
    end
  end
  
  def add_friend
    @friend = User.find(params[:friend])
    current_user.friendships.build(friend_id: @friend.id)
    if current_user.save
      flash[:success] = "Friend successfully added"
    else
      flash[:danger] = "Woops!. An error has occurred"
    end
    redirect_to my_friends_path
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :username, :search)
  end
end
