package com.jhta.groupware.work.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RequestWorkDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE = "com.jhta.groupware.mybatis.RequestWorkMapper";
	//��ٽð� �Է�
	public void insertRequestWorkStart() {
		
	}
	//��ٽð� �Է�
	public void insertRequestWorkEnd() {
		
	}
	//��ٽð� ��������
	public void selectRequestWorkStart() {
		
	}
	//��ٽð� ��������
	public void selectRequestWorkEnd() {
		
	}
}
