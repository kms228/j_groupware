package com.jhta.groupware.chat.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.messaging.simp.annotation.SendToUser;
import org.springframework.stereotype.Controller;
import org.springframework.web.util.HtmlUtils;

import com.jhta.groupware.chat.service.GreetingService;
import com.jhta.groupware.chat.vo.ChatUserVo;
import com.jhta.groupware.chat.vo.ChatVo;
import com.jhta.groupware.chat.vo.Greeting;
import com.jhta.groupware.chat.vo.HelloMessage;

@Controller
public class GreetingController {
		
	@Autowired private GreetingService service;
	@Autowired private SimpMessagingTemplate simpMessagingTemplate; 
	
    @MessageMapping("/hello")
    @SendTo("/topic/greetings")
    public Greeting greeting(HelloMessage message, Principal principal) throws Exception {
        Thread.sleep(1000); // simulated delay
        System.out.println(message.getName());
        return new Greeting("Hello, " + HtmlUtils.htmlEscape(principal.getName()) + "!");
    }
    @MessageMapping("/add/chatlist")
    public void addChatlist(Principal principal) throws Exception {
    	simpMessagingTemplate.convertAndSendToUser(principal.getName(),"/topic/list", service.addUser(principal));    	
    }
    @MessageMapping("/echo/user")
    @SendToUser(broadcast=false)
    public void addUser(Principal principal) throws Exception { 
    	System.out.println("----------------------------------------------");
    	simpMessagingTemplate.convertAndSend("/topic/add", service.getChatUser(principal));
    }
    @MessageMapping("/chat/message/{username}")
    public void sendMessage(@Payload ChatVo vo, @DestinationVariable ("username") String username, Principal principal) throws Exception {
        Thread.sleep(1000); // simulated delay
        System.out.println("행복한 그리팅 컨트롤러 :"+vo.getMessage());
        service.filloutChatVo(vo, principal);        
        System.out.println(vo.getEmp_name());
        System.out.println(vo.getPst_name());
        
        simpMessagingTemplate.convertAndSendToUser(username, "/topic/message", vo);
    }    
//    @MessageMapping("/endpoint")
//    @SendTo("/topic/greetings")    
//    public ResponseEntity<String> stomp(String request) {
//    	System.out.println(request);
//        return new ResponseEntity<String>(request, HttpStatus.OK);
//    }
}