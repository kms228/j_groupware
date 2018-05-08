package com.jhta.groupware.chat.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.HtmlUtils;

import com.jhta.groupware.chat.service.GreetingService;
import com.jhta.groupware.chat.vo.ChatUserVo;
import com.jhta.groupware.chat.vo.Greeting;
import com.jhta.groupware.chat.vo.HelloMessage;

@Controller
public class GreetingController {
		
	@Autowired private GreetingService service;
	private SimpMessagingTemplate messagingTemplate; 
	
    @MessageMapping("/hello")
    @SendTo("/topic/greetings")
    public Greeting greeting(HelloMessage message, Principal principal) throws Exception {
        Thread.sleep(1000); // simulated delay
        System.out.println(message.getName());
        return new Greeting("Hello, " + HtmlUtils.htmlEscape(principal.getName()) + "!");
    }
    @MessageMapping("/add/chatlist")
    @SendTo("/topic/add/result")
    public List<ChatUserVo> addChatlist(Principal principal) throws Exception {    	
//    	for(ChatUserVo vo:list) {
//    		System.out.println("greetingController list:::"+vo.getAcnt_id());
//    	}
        return service.addUser(principal);
    }
    @MessageMapping("/chat/message")
    @SendTo("/topic/add/result")
    public void sendMessage(Principal principal) throws Exception {
        Thread.sleep(1000); // simulated delay
        System.out.println("гоюл");
    }
//    @MessageMapping("/endpoint")
//    @SendTo("/topic/greetings")    
//    public ResponseEntity<String> stomp(String request) {
//    	System.out.println(request);
//        return new ResponseEntity<String>(request, HttpStatus.OK);
//    }
}