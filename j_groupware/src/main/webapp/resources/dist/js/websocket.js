var stompClient = null;
var globalAcnt_id = null;
var user_name = null;

function setConnected(connected) {

}

function connect() {
    var socket = new SockJS('/groupware/endpoint');
//    console.log(socket);
    
    stompClient = Stomp.over(socket);      
    stompClient.connect({}, function (frame) {
//        setConnected(true);    	
        console.log('Connected: ' + frame);
        user_name = frame.headers["user-name"];
        stompClient.subscribe('/user/topic/list', function(users) {
        	echoUser();
        	//console.log('야호 users:'+users);        	
            addUserlist(JSON.parse(users.body));            
        });
        stompClient.subscribe('/topic/add', function(user) {
        	//console.log('-----------------------');
        	//console.log('--------/topic/add--------')
        	addUser(JSON.parse(user.body));          
        });
        stompClient.subscribe('/user/topic/message', function(message) {
        	var msg = JSON.parse(message.body);
//        	alert('message: '+ msg);
        	showChatlist(msg);
        	addDB(msg);            
        });
        stompClient.subscribe('/topic/quit', function(acnt_id) {        	
        	$("#userList > li > a#"+acnt_id.body+":parent").remove();        	
        });    
        addChatlist();    
    },function(frame){
    	console.log("errorCallback::: 웹소켓 연결이 중지 되었습니다.");
    });    
}

function disconnect() {
	alert("여기는 disconnect()");
	stompClient.send("/app/quit", {});
    if (stompClient !== null) {    	
        stompClient.disconnect();
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
	  if(!(user_name===users[i].acnt_id)){
		acnt_id = users[i].acnt_id;
		$("#userList").append(
				'<li><a href="#control-sidebar-chatting-tab" data-toggle="tab" id="'+users[i].acnt_id +'"><i class="menu-icon fa fa-lightbulb-o bg-white"></i><div class="contacts-list-info">'+
				'<span class="contacts-list-name">'+users[i].pst_name+' '+users[i].emp_name+'<small class="contacts-list-date pull-right">'+users[i].dept_name+'</small></span>'+
				'<span class="contacts-list-msg">i will message for you</span></div></a></li>');
		$("#"+acnt_id).on('click',function(event){
			cleanTheChattingRoom();
			globalAcnt_id = $(this).prop("id");
			read(globalAcnt_id);
			bulbOff($(this).prop("id"));
			$("#userTab").removeClass("active");
			$("#chatTab").addClass("active");
			$("#control-sidebar-users-tab").removeClass("active");
			$("#control-sidebar-chatting-tab").addClass("active");
		});
	  }
	}
}
function addDB(chat){
//	alert("addDB:"+chat.acnt_id);
	add({acnt_id : chat.acnt_id, name : chat.pst_name+' '+chat.emp_name, message:chat.message, chatDate:chat.chatDate, username:user_name});
}
function showChatlist(chat){	
//	alert(globalAcnt_id);
//	alert($('#control-sidebar-chatting-tab').prop("class"));
	var tab_class = $('#control-sidebar-chatting-tab').prop("class");
	if(globalAcnt_id===chat.acnt_id && tab_class ==='tab-pane direct-chat-primary active'){
		$("#chatContents").append('<div class="direct-chat-messages"><div class="direct-chat-msg"><div class="direct-chat-info clearfix"><span class="direct-chat-name pull-left">'+
				chat.pst_name+' '+chat.emp_name+'</span><span class="direct-chat-timestamp pull-right">'+moment(chat.chatDate).format('MM월 DD일 HH시 mm분')+'</span></div>'+
				'<div class="direct-chat-text">'+chat.message+
				'</div></div></div>');
		$("#chatContents").scrollTop($("#chatContents")[0].scrollHeight);
	}
	if(!(globalAcnt_id===chat.acnt_id && tab_class ==='tab-pane direct-chat-primary active')){
		bulbOn(chat.acnt_id);
	}

}
function showChatlistInDB(chat){
//	alert(chat.name);
//	alert('showChatlistInDB');
//	console.log('나 아이디인 사람들의 날짜'+typeof chat.chatDate);
	if(chat.name!=='나'){
		
		$("#chatContents").append('<div class="direct-chat-messages"><div class="direct-chat-msg"><div class="direct-chat-info clearfix"><span class="direct-chat-name pull-left">'+
				chat.name+'</span><span class="direct-chat-timestamp pull-right">'+moment(chat.chatDate).format('MM월 DD일 HH시 mm분')+'</span></div>'+
				'<div class="direct-chat-text">'+chat.message+
				'</div></div></div>');
		$("#chatContents").scrollTop($("#chatContents")[0].scrollHeight);	
	} else {
		//console.log('invalid date???:'+chat.chatDate);
		$("#chatContents").append('<div class="direct-chat-msg right"><div class="direct-chat-info clearfix"><span class="direct-chat-name pull-right">'+
				'나'+'</span><span class="direct-chat-timestamp pull-left">'+moment(chat.chatDate).format('MM월 DD일 HH시 mm분')+'</span></div><div class="direct-chat-text">'+
				chat.message+'</div></div>');
		$("#chatContents").scrollTop($("#chatContents")[0].scrollHeight);	
	}	
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
	if(!(user_name===user.acnt_id) && result !== user.acnt_id){
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
function chatMyself(msg){
	var now = moment();	
	add({acnt_id:globalAcnt_id, name: '나', message:msg, chatDate:Number(now.format('x')), username:user_name});
	$("#chatContents").append('<div class="direct-chat-msg right"><div class="direct-chat-info clearfix"><span class="direct-chat-name pull-right">'+
			'나'+'</span><span class="direct-chat-timestamp pull-left">'+now.format('MM월 DD일 HH시 mm분')+'</span></div><div class="direct-chat-text">'+
			msg+'</div></div>');
	$("#chatContents").scrollTop($("#chatContents")[0].scrollHeight);
	$("#chatContent").prop('value','');
	
}

$(function () {	
	connect();	
    $("#stompSend, #wsConnect, #realChat").on('submit', function (e) {    	
        e.preventDefault();
    });
//    $( "#disconnect" ).click(function() { disconnect(); });    
    $( "#realChat").on('submit',function(e) {
    	//console.log("globalAcnt_id :"+globalAcnt_id);
    	sendMessage($("#chatContent").val());
    	e.preventDefault();    	
    });
});