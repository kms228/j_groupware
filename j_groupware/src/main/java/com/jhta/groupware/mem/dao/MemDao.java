package com.jhta.groupware.mem.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.groupware.login.vo.LoginVo;
import com.jhta.groupware.member.vo.MemberAccountVo;

@Repository
public class MemDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="com.jhta.groupware.mybatis.JoinMapper";
	
	public MemberAccountVo Accinfo(String ACNT_ID) {
		System.out.println(ACNT_ID+"+dao");
		return sqlSession.selectOne(NAMESPACE+".searchid", ACNT_ID);
	}
	public LoginVo Empinfo(int emp_num) {
		System.out.println(emp_num+"+dao");
		return sqlSession.selectOne(NAMESPACE+".memInfo", emp_num);
	}
	public int AcUpdate(HashMap<String, Object> map1) {
		System.out.println(map1+"+dao");
		return sqlSession.update(NAMESPACE+".acUpdate",map1);
	}
	public int EmpUpdate(HashMap<String, Object> map2) {
		System.out.println(map2+"+dao");
		return sqlSession.update(NAMESPACE+".empUpdate", map2);
	}

}
