package com.jhta.groupware.chat.controller;

import java.security.Principal;
import java.util.Map;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.DefaultHandshakeHandler;

public class MyHandshakeHandler extends DefaultHandshakeHandler{

	@Override
	protected Principal determineUser(ServerHttpRequest request, WebSocketHandler wsHandler,
			Map<String, Object> attributes) {
		
		ServletServerHttpRequest ssreq = (ServletServerHttpRequest) request;				
		System.out.println("-----------------------determineUser()");				
		String sessionId = (String) ssreq.getServletRequest().getSession().getAttribute("ACNT_ID");
		System.out.println("ACNT_ID : "+ssreq.getServletRequest().getSession().getAttribute("ACNT_ID"));		
		System.out.println("determineUser()------------------------------");
		
		Principal principal = new Principal() {
			
			@Override
			public String getName() {
				return sessionId;
			}
		};
		
		return principal;
	}
	
}
