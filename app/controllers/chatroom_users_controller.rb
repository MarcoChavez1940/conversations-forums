class ChatroomUsersController < ApplicationController
    def leaveRoom
        ChatroomUser.where(user_id: 1).destroy
    end
end
