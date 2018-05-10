package com.jhta.groupware.chat.controller;

import java.util.Map;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

public class MyHandshakeInterceptor extends HttpSessionHandshakeInterceptor{

	@Override
	public boolean beforeHandshake(ServerHttpRequest req, ServerHttpResponse resp, WebSocketHandler arg2,
			Map<String, Object> arg3) throws Exception {
		ServletServerHttpRequest ssreq = (ServletServerHttpRequest) req;
		String sessionId = (String) ssreq.getServletRequest().getSession().getAttribute("ACNT_ID");
//		System.out.println("--------------------------------------------<beforeHandshake>");
//		System.out.println(sessionId);
//		System.out.println("--------------------------------------------<beforeHandshake>");
		if(sessionId==null) {
			throw new Exception();
		}
		return super.beforeHandshake(req, resp, arg2, arg3);
	}
	
}
