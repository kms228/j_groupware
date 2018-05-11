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
	public List<ChatUserVo> getList(String acnt_id) {
		ArrayList<ChatUserVo> list1 = new ArrayList<ChatUserVo>();
		boolean result = true;
		for(int i=0;i<list.size();i+=1) {
			result = acnt_id.equals(list.get(i).getAcnt_id());
			if(!result){
				list1.add(list.get(i));
				System.out.println("getList:"+list.get(i).getAcnt_id());
			}
		}
		return list1;
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
	public ChatUserVo getChatUserVo(String acnt_id) {
		int size = list.size();
		for(int i=0;i<size;i+=1) {			
			if(acnt_id.equals(list.get(i).getAcnt_id())) {
				return list.get(i);
			}
		}
		return null;
	}
	public boolean removeChatUserVo(String acnt_id) {
		int size = list.size();
		for(int i=0;i<size;i+=1) {			
			if(acnt_id.equals(list.get(i).getAcnt_id())) {
				list.remove(i);
				return true;
			}
		}
		return false;
	}
}
