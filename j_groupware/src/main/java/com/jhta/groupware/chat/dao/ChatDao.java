package com.jhta.groupware.chat.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.groupware.chat.vo.ChatUserVo;

@Repository
public class ChatDao {
	@Autowired private SqlSession session;
	private final String NAMESPACE = "com.jhta.groupware.mybatis.ChatMapper";
	
	public ChatUserVo getUser(String acnt_id) {
		System.out.println("chatDao chatDao");
		return session.selectOne(NAMESPACE+".getUser",acnt_id);
	}
	
}
