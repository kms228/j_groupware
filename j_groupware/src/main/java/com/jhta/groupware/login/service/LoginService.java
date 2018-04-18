package com.jhta.groupware.login.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.groupware.login.dao.LoginDao;
import com.jhta.groupware.login.vo.LoginVo;
import com.jhta.groupware.member.vo.MemberAccountVo;

@Service
public class LoginService {
	@Autowired
	private LoginDao dao ;
	public MemberAccountVo login(HashMap<String,Object>map) {
		MemberAccountVo vo = dao.login(map);
		if(vo!=null) {
			System.out.println("서비스 통과");
			return vo;
		}else {
			System.out.println("서비스XXXX");
			return null;
		}
	}
	public LoginVo getinfo(int EMP_NUM) {
		LoginVo vo = dao.logininfo(EMP_NUM);
		if(vo!=null) {
			System.out.println("회원정보보내기 성공");
			return vo;
		}else {
			System.out.println("아이디 못 불러옴");
			return null;
		}
	}
}
