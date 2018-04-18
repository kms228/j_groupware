package com.jhta.groupware.join.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.groupware.login.vo.LoginVo;
import com.jhta.groupware.member.vo.MemberAccountVo;
@Repository
public class JoinDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="com.jhta.groupware.mybatis.JoinMapper";
	
	public int isMember(HashMap<String,Object>map) {
		return sqlSession.selectOne(NAMESPACE+".insert", map);
	}
	public MemberAccountVo searchid(String ACNT_ID) {
		return sqlSession.selectOne(NAMESPACE+".searchid", ACNT_ID);
	}
	public LoginVo searchemail(String EMP_EMAIL) {
		System.out.println(EMP_EMAIL+"Dao¿¡ ´ã±è");
		return sqlSession.selectOne(NAMESPACE+".searchemail", EMP_EMAIL);
	}
	
}
