package com.jhta.groupware.chat.service;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.groupware.chat.dao.ChatDao;
import com.jhta.groupware.chat.vo.ChatUserVo;
import com.jhta.groupware.chat.vo.UserList;

@Service
public class GreetingService {	
	@Autowired private ChatDao dao;
	@Autowired private UserList list;
		
	public List<ChatUserVo> addUser(Principal principal) {
		boolean swit = true;
		System.out.println("Greeting Service");
		swit = list.searchAcnt_id(principal.getName());
		if(!swit) {
			System.out.println("greetingService:::"+principal.getName());
			String acnt_id = principal.getName();
			ChatUserVo vo = dao.getUser(acnt_id);
			list.addList(vo);
			return list.getList();
		}
		return list.getList();
	}
	public void disconnectUser() {
		System.out.println("--------------------------------------------------");
		System.out.println("disconnectUser!!!!");
		System.out.println("--------------------------------------------------");
	}
	public void connectUser() {
//		ChatUsersVo vo = dao.getUser();
		System.out.println("--------------------------------------------------");
		System.out.println("connectUser!!!!");
		System.out.println("--------------------------------------------------");
	}	
}
