package com.jhta.groupware.work.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RequestWorkDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE = "com.jhta.groupware.mybatis.RequestWorkMapper";
	//출근시간 입력
	public void insertRequestWorkStart() {
		
	}
	//퇴근시간 입력
	public void insertRequestWorkEnd() {
		
	}
	//출근시간 가져오기
	public void selectRequestWorkStart() {
		
	}
	//퇴근시간 가져오기
	public void selectRequestWorkEnd() {
		
	}
}
