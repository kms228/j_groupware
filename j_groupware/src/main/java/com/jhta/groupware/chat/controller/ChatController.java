package com.jhta.groupware.chat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChatController {
	
	@RequestMapping("/socketTest")
	public String chatTest() {
		return ".chat.socketTest";
	}
}
