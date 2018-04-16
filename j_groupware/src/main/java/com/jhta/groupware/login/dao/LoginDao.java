package com.jhta.groupware.login.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.groupware.login.vo.LoginVo;
import com.jhta.groupware.member.vo.MemberAccountVo;

@Repository
public class LoginDao {
	@Autowired private SqlSession sqlsession;
	private final String NAMESPACE="com.jhta.groupware.mybatis.LoginMapper";
	
	public MemberAccountVo login(HashMap<String, Object>map) {
		return sqlsession.selectOne(NAMESPACE+".select",map);
	}
	public LoginVo logininfo(int EMP_NUM) {
		return sqlsession.selectOne(NAMESPACE+".getinfo", EMP_NUM);
	}

}
