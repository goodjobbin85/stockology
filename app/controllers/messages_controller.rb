class MessagesController < ApplicationController 
    def new 
        @message = Message.new 
    end 

    def create 
        message = current_user.messages.build(message_params) 
        if message.save 
            ActionCable.server.broadcast("chatroom_channel", new_message: render_message(message))
    
        end 
    end 

    
    private 

    def message_params 
        params.require(:message).permit(:body)
    end 

    def render_message(message) 
        render(partial: 'message', locals: { message: message })
    end 
end 

