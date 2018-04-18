package com.jhta.groupware.join.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.groupware.join.dao.JoinDao;
import com.jhta.groupware.login.vo.LoginVo;
import com.jhta.groupware.member.vo.MemberAccountVo;

@Service
public class JoinService {
	@Autowired
	private JoinDao dao;
	
	public int isMember(HashMap<String, Object>map) {
		System.out.println("가입 서비스 지나간다");
		return dao.isMember(map);
	}

	public MemberAccountVo searchid(String ACNT_ID) {
		System.out.println(ACNT_ID+"서비스지나가시는중");
		return dao.searchid(ACNT_ID);
	}
	public LoginVo searchemail(String EMP_EMAIL) {
		System.out.println(EMP_EMAIL+"서비스에담김");
		return dao.searchemail(EMP_EMAIL);
	}
}
