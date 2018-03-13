class ChatroomUsersController < ApplicationController

    def destroy
        @userLeaveRoom = ChatroomUser.where(chatroom_id: params[:chatroom_id] ,username: current_user.username).destroy_all
        

        @chatroom_id = params[:chatroom_id]
        #Emitir al broadcast para que los demas usuarios reciban la notificacion que un usario dejo la sala.
        ActionCable.server.broadcast "leaves_#{@chatroom_id}_channel",
            username: current_user.username
 
        redirect_to chatrooms_path

    end

    

end
