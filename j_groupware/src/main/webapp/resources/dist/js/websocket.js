var stompClient = null;
var globalAcnt_id = null;
var username = null;

function setConnected(connected) {
//    $("#connect").prop("disabled", connected);
//    $("#disconnect").prop("disabled", !connected);
//    if (connected) {
//        $("#conversation").show();
//    }
//    else {
//        $("#conversation").hide();
//    }
//    $("#greetings").html("");
}

function connect() {
    var socket = new SockJS('/groupware/endpoint');
    console.log(socket);
    stompClient = Stomp.over(socket);    
    stompClient.connect({}, function (frame) {
//        setConnected(true);
        console.log('Connected: ' + frame);
        username = frame.headers["user-name"];        
        stompClient.subscribe('/user/topic/list', function(users) {
        	echoUser();
        	console.log('야호 users:'+users);        	
            addUserlist(JSON.parse(users.body));            
        });
        stompClient.subscribe('/topic/add', function(user) {
        	console.log('-----------------------');
        	console.log('--------/topic/add--------')
        	addUser(JSON.parse(user.body));          
        });
        stompClient.subscribe('/user/topic/message', function(message) {
        	console.log('---------------------------');
        	console.log(JSON.parse(message.body));
        	console.log('message: '+message);
            showChatlist(JSON.parse(message.body));       
        });
        addChatlist();
    });
}

function disconnect() {
    if (stompClient !== null) {
        stompClient.disconnect(function(){
        	$("#control-sidebar-users-tab").empty();
        });
    }
//    setConnected(false);
    console.log("Disconnected");
}
function sendMessage(message){	
	if(!(message==='')){
		chatMyself(message);
		stompClient.send("/app/chat/message/"+globalAcnt_id, {}, JSON.stringify({"message": message}));	
	}	
}
function sendName() {
    stompClient.send("/app/hello", {}, JSON.stringify({'name': $("#name").val()}));
}
function addChatlist(){
	stompClient.send("/app/add/chatlist",{});	
}
function echoUser(){
	stompClient.send("/app/echo/user",{});
}

function showGreeting(message) {
    $("#greetings").append("<tr><td>" + message + "</td></tr>");
}
function addUserlist(users){	
	var acnt_id;	
	for(i in users){
	  if(!(username===users[i].acnt_id)){
		acnt_id = users[i].acnt_id;
		$("#userList").append(
				'<li><a href="#control-sidebar-chatting-tab" data-toggle="tab" id="'+users[i].acnt_id +'"><i class="menu-icon fa fa-lightbulb-o bg-white"></i><div class="contacts-list-info">'+
				'<span class="contacts-list-name">'+users[i].pst_name+' '+users[i].emp_name+'<small class="contacts-list-date pull-right">'+users[i].dept_name+'</small></span>'+
				'<span class="contacts-list-msg">i will message for you</span></div></a></li>');
		$("#"+acnt_id).on('click',function(event){
			cleanTheChattingRoom();
			globalAcnt_id = $(this).prop("id");
			bulbOff($(this).prop("id"));
			$("#userTab").removeClass("active");
			$("#chatTab").addClass("active");
			$("#control-sidebar-users-tab").removeClass("active");
			$("#control-sidebar-chatting-tab").addClass("active");
		});
	  }
	}
}
function showChatlist(chat){
	bulbOn(chat.acnt_id);
	$("#chatContents").append('<div class="direct-chat-messages"><div class="direct-chat-msg"><div class="direct-chat-info clearfix"><span class="direct-chat-name pull-left">'+
			chat.pst_name+' '+chat.emp_name+'</span><span class="direct-chat-timestamp pull-right">'+chat.chatDate+'</span></div>'+
			'<div class="direct-chat-text">'+chat.message+
			'</div></div></div>');
	$("#chatContents").scrollTop($("#chatContents")[0].scrollHeight);
/*	
  <div class="direct-chat-messages">
    <div class="direct-chat-msg">
      <div class="direct-chat-info clearfix">
        <span class="direct-chat-name pull-left">Alexander Pierce</span>
        <span class="direct-chat-timestamp pull-right">23 Jan 2:00 pm</span>
      </div>      
      <img class="direct-chat-img" src="../dist/img/user1-128x128.jpg" alt=""><!-- /.direct-chat-img -->
      <div class="direct-chat-text">
        Is this template really for free? That's unbelievable!        
      </div>
    </div>
  </div>
*/
}
function bulbOn(acnt_id){
	var li = $("#userList > li > a#"+acnt_id);
	var result = $(li).prop("id");
	$("#"+result+" > i").prop("class","menu-icon fa fa-lightbulb-o bg-yellow");
}
function bulbOff(acnt_id){
	var li = $("#userList > li > a#"+acnt_id);
	var result = $(li).prop("id");
	$("#"+result+" > i").prop("class","menu-icon fa fa-lightbulb-o bg-white");
}
function addUser(user){
	var li = $("#userList > li > a#"+user.acnt_id);
	var result = $(li).prop("id");
//	console.log("li :"+$(li).prop("id"));
	if(!(username===user.acnt_id) && result !== user.acnt_id){
	  $("#userList").append(
			'<li><a href="#control-sidebar-chatting-tab" data-toggle="tab" id="'+user.acnt_id +'"><i class="menu-icon fa fa-lightbulb-o bg-white"></i><div class="contacts-list-info">'+
			'<span class="contacts-list-name">'+user.pst_name+' '+user.emp_name+'<small class="contacts-list-date pull-right">'+user.dept_name+'</small></span>'+
			'<span class="contacts-list-msg">i will message for you</span></div></a></li>');
	  $("#"+user.acnt_id).on('click',function(event){
		  cleanTheChattingRoom();
		globalAcnt_id = $(this).prop("id");
		$("#userTab").removeClass("active");
		$("#chatTab").addClass("active");
		$("#control-sidebar-users-tab").removeClass("active");
		$("#control-sidebar-chatting-tab").addClass("active");
	  });
	}
}
function cleanTheChattingRoom(){
	$("#chatContents").empty();
}
function chatMyself(message){
	$("#chatContents").append('<div class="direct-chat-msg right"><div class="direct-chat-info clearfix"><span class="direct-chat-name pull-right">'+
			'나'+'</span><span class="direct-chat-timestamp pull-left">'+'날짜 적는곳'+'</span></div><div class="direct-chat-text">'+
			message+'</div></div>');
	$("#chatContents").scrollTop($("#chatContents")[0].scrollHeight);
	/*
    <div class="direct-chat-msg right">
      <div class="direct-chat-info clearfix">
        <span class="direct-chat-name pull-right">Sarah Bullock</span>
        <span class="direct-chat-timestamp pull-left">23 Jan 2:05 pm</span>
      </div>
      <img class="direct-chat-img" src="../dist/img/user3-128x128.jpg" alt="Message User Image"><!-- /.direct-chat-img -->
      <div class="direct-chat-text">
        You better believe it!
      </div>
    </div>
	*/
}

$(function () {
	connect();	
    $("#stompSend, #wsConnect, #realChat").on('submit', function (e) {
        e.preventDefault();
    });
//    $( "#disconnect" ).click(function() { disconnect(); });    
    $( "#realChat").on('submit',function(e) {
    	console.log("globalAcnt_id :"+globalAcnt_id);
    	sendMessage($("#chatContent").val());
    	e.preventDefault();    	
    });
});