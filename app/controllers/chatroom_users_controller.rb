class ChatroomUsersController < ApplicationController

def show
    user = ChatroomUser.new(:chatroom_id => @chatroom.id, :user_id => current_user.id)
    user.save
    @chatroomUsers = ChatroomUser.all
end

    def leaveRoom

        ChatroomUser.where(user_id: 1).destroy
    end
end
