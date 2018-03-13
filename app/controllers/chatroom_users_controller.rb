class ChatroomUsersController < ApplicationController

    def destroy
        @userLeaveRoom = ChatroomUser.where(chatroom_id: params[:chatroom_id] ,username: current_user.username).destroy_all
        redirect_to chatrooms_path   
    end

end
