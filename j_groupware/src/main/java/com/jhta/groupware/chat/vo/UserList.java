package com.jhta.groupware.chat.vo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class UserList {
	private List<ChatUserVo> list;
	
	public UserList() {
		list = new ArrayList<ChatUserVo>();
		System.out.println("userList »ý¼º");
	}	
	public List<ChatUserVo> getList() {
		return list;
	}
	public void addList(ChatUserVo vo) {
		list.add(vo);
	}
	public boolean searchAcnt_id(String acnt_id) {
		List<ChatUserVo> list1 = getList();
		if(acnt_id == null) {
			return true;
		}
		for(ChatUserVo vo:list1) {
			if(vo.getAcnt_id().equals(acnt_id)) {				
				return true;
			}
		}	
		return false;		
	}
	
	
	
}
