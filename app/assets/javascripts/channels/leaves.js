$(document).ready(function() {
    chatroomId = $('input#message_chatroom_id').val();
    App.messages = App.cable.subscriptions.create({ channel: 'LeavesChannel', chatroom_id: chatroomId }, {
        received: function(data) {
            alertify.warning(data.username + " Ha dejado la sala :(");
            //alert(data.username + " Ha dejado la sala :(");
            $("#users").removeClass('hidden');
            return document.getElementById(data.username).remove();

            //return $('#users').append(this.renderMessage(data));
        },
        chatroom_id: function(data) {
            return data.chatroom_id
        },
        renderMessage: function(data) {
            return "<p> <b>" + data.username + "</b>" + "</p>";
        }
    });
})