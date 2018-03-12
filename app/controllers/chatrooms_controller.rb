class ChatroomsController < ApplicationController

    def index
        @chatroom = Chatroom.new
        @chatrooms = Chatroom.all
    end

  def new
    if request.referrer.split("/").last == "chatrooms"
      flash[:notice] = nil
    end
    @chatroom = Chatroom.new
  end

  def edit
    @chatroom = Chatroom.find_by(slug: params[:slug])
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    if @chatroom.save
      respond_to do |format|
        format.html { redirect_to @chatroom }
        format.js
      end
    else
      respond_to do |format|
        flash[:notice] = {error: ["a chatroom with this topic already exists"]}
        format.html { redirect_to new_chatroom_path }
        format.js { render template: 'chatrooms/chatroom_error.js.erb'} 
      end
    end
  end

  def update
    chatroom = Chatroom.find_by(slug: params[:slug])
    chatroom.update(chatroom_params)
    redirect_to chatroom
  end

  def show
    @chatroom = Chatroom.find_by(slug: params[:slug])
    @message = Message.new

    #Add the user to table Chatroom-Users

    @userSearch = ChatroomUser.where(chatroom_id: @chatroom.id, username: current_user.username)

    if @userSearch.empty?
      user = ChatroomUser.new(:Chatroom_id => @chatroom.id, :username => current_user.username)
      user.save
    end

    @chatroomUsers = ChatroomUser.where(chatroom_id: @chatroom.id)

    #Emitir al broadcast para que los demas usuarios reciban al nuevo ususario
    #ActionCable.server.broadcast "messages_#{message.chatroom_id}_channel",
    #    message: message.content,
    #    user: message.user.username
    #head :ok
  end

  private

    def chatroom_params
      params.require(:chatroom).permit(:topic)
    end

end
