package com.jhta.groupware.work.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.groupware.work.vo.AnnualVo;

@Repository
public class AnnualDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE = "com.jhta.groupware.mybatis.work.RequestWorkMapper";
	//사원의 연차정보 가져오기
	public AnnualVo selectAnn(Map<String, Object> map) {
		return sqlSession.selectOne(NAMESPACE+".selectAnn", map);
	}
}
