package com.jhta.groupware.work.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.groupware.work.vo.Work_TypeVo;

@Repository
public class WorkListDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE = "com.jhta.groupware.mybatis.work.WorkListMapper";
	
	//근태신청 타입리스트부르기
	public List<Work_TypeVo> selectWorkType() {
		return sqlSession.selectList(NAMESPACE+".selectWorkType");
	}
}
