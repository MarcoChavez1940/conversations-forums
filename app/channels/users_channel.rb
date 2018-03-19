class UsersChannel < ApplicationCable::Channel  
  def subscribed
    #stream_from 'messages'
    stream_from "users_#{params['chatroom_id']}_channel"
  end
end 