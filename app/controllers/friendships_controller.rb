class FriendshipsController < ApplicationController
    
    def create 
    end 
    
    def destroy
        @friendship = current_user.friendships.where(friend_id: params[:id]).first
        if @friendship.destroy
            flash[:success] = "User succesfully removed from friends"
            redirect_to my_friends_path
        else
            flash[:danger] = "Sorry, something went wrong."
            redirect_to my_friends_path
        end
    end
end
