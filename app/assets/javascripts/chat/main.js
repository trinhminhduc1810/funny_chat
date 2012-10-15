$("document").ready(function(){
    $("#add_friend_button").click(add_friend);
});

function add_friend(){
    data = {username: $("#friend_username").val()};
    sendRequest("POST","/chat/add_friend",data,"add_friend");
    $("#friend_username").val("");
}

function sendRequest(method,url,data,action) {
    $.ajax({
        type: method,
        url: url,
        data: data,
        success: function(data) {
            call_back_action(data,action);
        }
    }
    );
}

function call_back_action(data,action) {
    switch(action)
    {
        case "add_friend":
            add_friend_list(data);
            break;
        default:
            break;
    }

}

function build_friend(name){
    var remove_link = "<a href='/chat/remove_friend?username="+name+"'>remove</a>";
    return "<li>"+name+"-------"+remove_link+"</li>";
}

function add_friend_list(data) {
    alert(data.status);
    if (data.friend) {
        $("#friend_list").append(build_friend(data.friend));
    }
}

