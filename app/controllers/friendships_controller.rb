class FriendshipsController < ApplicationController
    
    def create 
    end 
    
    def destroy
        @friendship = current_user.friendships.where(friend_id: params[:id]).first
        if @friendship.destroy
            flash[:success] = "User succesfully removed from friends"
            redirect_to current_user
        else
            flash[:danger] = "Sorry, something went wrong."
            redirect_to current_user
        end
    end
end
