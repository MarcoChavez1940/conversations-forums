class ChatroomUsersController < ApplicationController

    def destroy
        @userLeaveRoom = ChatroomUser.where(chatroom_id: params[:chatroom_id] ,username: current_user.username).destroy_all
        

        @chatroom_id = params[:chatroom_id]
        #Emitir al broadcast para que los demas usuarios reciban la notificacion que un usario dejo la sala.
        ActionCable.server.broadcast "leaves_#{@chatroom_id}_channel",
            username: current_user.username
 
        #Eliminar la sala si ya no hay mas usuarios en el.
        userInRoom = ChatroomUser.where(chatroom_id: @chatroom_id)
        if userInRoom.empty?
            @chatroomDestroy = Chatroom.where(id: @chatroom_id).destroy_all
        end

        redirect_to chatrooms_path

    end

end
