package com.jhta.groupware.work.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.groupware.work.vo.ScheduleVo;
import com.jhta.groupware.work.vo.SearchTodayVo;

@Repository
public class WorkDao {
	@Autowired private SqlSession sqlSession;
	
	private final String NAMESPACE = "com.jhta.mybatis.work.WorkMapper";
	//달력
	public List<ScheduleVo> searchSch(Map<String, Object>map){
		return sqlSession.selectList(NAMESPACE+".schedule", map);
	}
	//today1 연차
	public List<SearchTodayVo> searchToday1(Map<String, Object>map){
		return sqlSession.selectList(NAMESPACE+".searchToday1",map);
	}
	
	//today2 반차
	public List<SearchTodayVo> searchToday2(Map<String, Object>map){
		return sqlSession.selectList(NAMESPACE+".searchToday2",map);
	}
}
