var stompClient = null;

function setConnected(connected) {
    $("#connect").prop("disabled", connected);
    $("#disconnect").prop("disabled", !connected);
    if (connected) {
        $("#conversation").show();
    }
    else {
        $("#conversation").hide();
    }
    $("#greetings").html("");
}

function connect() {
    var socket = new SockJS('/groupware/endpoint');
    console.log(socket);
    stompClient = Stomp.over(socket);    
    stompClient.connect({}, function (frame) {
        setConnected(true);
        console.log('Connected: ' + frame);                      
        stompClient.subscribe('/topic/add/result', function(users) {
            showChatlist(JSON.parse(users.body));            
        });
        addChatlist();
    });
}

function disconnect() {
    if (stompClient !== null) {
        stompClient.disconnect();
    }
    setConnected(false);
    console.log("Disconnected");
}

function sendName() {
    stompClient.send("/app/hello", {}, JSON.stringify({'name': $("#name").val()}));
}
function addChatlist(){
	stompClient.send("/app/add/chatlist",{});	
} 
function showGreeting(message) {
    $("#greetings").append("<tr><td>" + message + "</td></tr>");
}
function showChatlist(users){	
	for(i in users){
		$("#userList").append(
				'<li id="'+users[i].acnt_id +'"><a href="#control-sidebar-chatting-tab" data-toggle="tab"><i class="menu-icon fa fa-birthday-cake bg-red"></i><div class="contacts-list-info">'+
				'<span class="contacts-list-name">'+users[i].pst_name+' '+users[i].emp_name+'<small class="contacts-list-date pull-right">2/28/2015</small></span>'+
				'<span class="contacts-list-msg">i will message for you</span></div></a></li>');		
	}		
}

/*function checkSession(callbackfunction){
	$.ajax({
		method: "get",
		url : "<c:url value='/getSchedules'/>",
		dataType : "json",
		success : function(data){
			
		}
	});
}*/
$(function () {
	connect();	
//	$( "#toggle_Right_Sidebar" ).click(function() { addChatlist(); });	
    $("#stompSend, #wsConnect, #realChat").on('submit', function (e) {
        e.preventDefault();
    });
//	$("#loginForm").on('submit', function (e) {
		//e.preventDefault();
//		console.log('로그인 폼을 거치는지 확인');
//		connect();
//	});
//	$( "#connect" ).click(function() { connect(); });
    $( "#disconnect" ).click(function() { disconnect(); });
    $( "#send1").on('submit',function(e) {
    	e.preventDefault();
    	console.log('야호');
    });
});