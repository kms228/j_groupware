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
		System.out.println("���� ���� ��������");
		return dao.isMember(map);
	}

	public MemberAccountVo searchid(String ACNT_ID) {
		System.out.println(ACNT_ID+"�����������ô���");
		return dao.searchid(ACNT_ID);
	}
	public LoginVo searchemail(String EMP_EMAIL) {
		System.out.println(EMP_EMAIL+"���񽺿����");
		return dao.searchemail(EMP_EMAIL);
	}
}
