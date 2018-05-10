package com.jhta.groupware.chat.service;

import java.security.Principal;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.groupware.chat.dao.ChatDao;
import com.jhta.groupware.chat.vo.ChatUserVo;
import com.jhta.groupware.chat.vo.ChatVo;
import com.jhta.groupware.chat.vo.UserList;

@Service
public class GreetingService {	
	@Autowired private ChatDao dao;
	@Autowired private UserList list;		
	
	public List<ChatUserVo> addUser(Principal principal) {
		String acnt_id = principal.getName();
		boolean swit = true;
		System.out.println("Greeting Service");
		swit = list.searchAcnt_id(principal.getName());
		if(!swit) {
			System.out.println("greetingService:::"+principal.getName());			
			ChatUserVo vo = dao.getUser(acnt_id);
			list.addList(vo);
		}
		return list.getList(acnt_id);
	}
	public ChatUserVo getChatUser(Principal principal) {
		return list.getChatUserVo(principal.getName());
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
	public ChatVo filloutChatVo(ChatVo vo, Principal principal) {
		ChatUserVo userVo = list.getChatUserVo(principal.getName());
		vo.setEmp_name(userVo.getEmp_name());
		vo.setPst_name(userVo.getPst_name());
		vo.setAcnt_id(principal.getName());
		vo.setChatDate(new Date());
		return vo;
	}	
}
