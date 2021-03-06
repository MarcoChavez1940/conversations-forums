class MessagesController < ApplicationController

    def create
        message = Message.new(message_params)
        message.user = current_user
        ChatroomUser.where(id: 11).destroy_all
        if message.save
            #ActionCable.server.broadcast 'messages',
            ActionCable.server.broadcast "messages_#{message.chatroom_id}_channel",
                message: message.content,
                user: message.user.username

            respond_to do |format|
                format.html { redirect_to @message }
                format.js
            end   
        else 
            redirect_to chatrooms_path
        end
    end

    private

    def message_params
      params.require(:message).permit(:content, :chatroom_id)
    end

end
