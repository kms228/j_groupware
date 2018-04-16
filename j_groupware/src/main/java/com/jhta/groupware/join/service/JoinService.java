package com.jhta.groupware.join.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.groupware.join.dao.JoinDao;
import com.jhta.groupware.member.vo.MemberAccountVo;

@Service
public class JoinService {
	@Autowired
	private JoinDao dao;
	public int isMember(HashMap<String, Object>map) {

		System.out.println(map.get("ACNT_ID")+"se");
	
		return dao.isMember(map);
	
	}
}
