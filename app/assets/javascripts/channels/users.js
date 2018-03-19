$(document).ready(function() {
    chatroomId = $('input#message_chatroom_id').val();
    App.messages = App.cable.subscriptions.create({ channel: 'UsersChannel', chatroom_id: chatroomId }, {
        received: function(data) {
            alertify.success(data.username + " Se ha unido a la sala :D");
            //alert(data.username + " Se ha unido a la sala :D");
            $("#users").removeClass('hidden');
            return $('#users').append(this.renderMessage(data));
        },
        chatroom_id: function(data) {
            return data.chatroom_id
        },
        renderMessage: function(data) {
            return "<p> <b>" + data.username + "</b>" + "</p>";
        }
    });
})