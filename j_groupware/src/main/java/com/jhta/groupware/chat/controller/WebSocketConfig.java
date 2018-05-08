package com.jhta.groupware.chat.controller;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.AbstractWebSocketMessageBrokerConfigurer;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;

@Configuration
@EnableWebSocketMessageBroker
public class WebSocketConfig extends AbstractWebSocketMessageBrokerConfigurer {		

	@Bean
	public MyHandshakeHandler myHandshakeHandler() {
		return new MyHandshakeHandler();
	}
		
	@Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
    	System.out.println(" ~~~엔드포인트~~~ ");    	
        registry.addEndpoint("/endpoint").setHandshakeHandler(myHandshakeHandler()).withSockJS();
        
    }
	@Override
    public void configureMessageBroker(MessageBrokerRegistry config) {
		config.enableSimpleBroker("/topic","/queue");
		config.setApplicationDestinationPrefixes("/app");
    }
    
}