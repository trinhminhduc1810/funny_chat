$("document").ready(function(){
    $("#add_friend_button").click(add_friend);
});

function add_friend(){
    data = {username: $("#friend_username").val()};
    sendRequest("POST","/chat/add_friend",data);
}

function sendRequest(method,url,data) {
    $.ajax({
        type: method,
        url: url,
        data: data,
        success: function(data) {
            update_friend_list(data);
        }
    }
    );
}

function update_friend_list(data) {
    alert(data.status);
}

