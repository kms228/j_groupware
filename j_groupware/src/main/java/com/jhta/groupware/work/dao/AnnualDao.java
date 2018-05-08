package com.jhta.groupware.work.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.groupware.work.vo.AnnualVo;

@Repository
public class AnnualDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE = "com.jhta.groupware.mybatis.work.RequestWorkMapper";
	//����� �������� ��������
	public AnnualVo selectAnn(int emp_num) {
		return sqlSession.selectOne(NAMESPACE+".selectAnn", emp_num);
	}
}
