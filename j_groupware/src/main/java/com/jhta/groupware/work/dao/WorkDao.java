package com.jhta.groupware.work.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class WorkDao {
	@Autowired private SqlSession sqlSession;
	
	private final String NAMESPACE = "com.jhta.mybatis.";
}
