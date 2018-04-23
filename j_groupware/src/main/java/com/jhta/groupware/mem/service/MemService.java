package com.jhta.groupware.mem.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.groupware.login.vo.LoginVo;
import com.jhta.groupware.mem.dao.MemDao;
import com.jhta.groupware.member.vo.MemberAccountVo;

@Service
public class MemService {
	@Autowired private MemDao dao;
	public MemberAccountVo Accinfo(String ACNT_ID) {
		System.out.println(ACNT_ID+"+service");
		return dao.Accinfo(ACNT_ID);
	}
	public LoginVo Empinfo(int emp_num) {
		System.out.println(emp_num+"+service");
		return dao.Empinfo(emp_num);
	}
	
	public int AcUpdate(HashMap<String, Object> map1) {
		System.out.println(map1+"AcUpdate // service");
		return dao.AcUpdate(map1);
	}
	public int EmpUpdate(HashMap<String, Object> map2) {
		System.out.println(map2+"EmpUpdate // service");
		return dao.EmpUpdate(map2);
	}

}
