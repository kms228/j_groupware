package com.jhta.groupware.work.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.groupware.work.vo.ScheduleVo;

@Repository
public class WorkDao {
	@Autowired private SqlSession sqlSession;
	
	private final String NAMESPACE = "com.jhta.mybatis.work.WorkMapper";
	
	public List<ScheduleVo> searchSch(Map<String, Object>map){
		return sqlSession.selectList(NAMESPACE+".schedule", map);
	}
}
