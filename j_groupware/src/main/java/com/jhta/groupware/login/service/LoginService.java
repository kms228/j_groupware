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
			System.out.println("���� ���");
			return vo;
		}else {
			System.out.println("����XXXX");
			return null;
		}
	}
	public LoginVo getinfo(int EMP_NUM) {
		LoginVo vo = dao.logininfo(EMP_NUM);
		if(vo!=null) {
			System.out.println("ȸ������������ ����");
			return vo;
		}else {
			System.out.println("���̵� �� �ҷ���");
			return null;
		}
	}
}
