class MessagesController < ApplicationController 
    def new 
        @message = Message.new 
    end 

    def create 
        @message = current_user.messages.build(message_params) 
        if @message.save 
            redirect_to chatroom_path
        end 
    end 

    
    private 

    def message_params 
        params.require(:message).permit(:body)
    end 
end 

