class LeavesChannel < ApplicationCable::Channel  
  def subscribed
    #stream_from 'messages'
    stream_from "leaves_#{params['chatroom_id']}_channel"
  end
end 