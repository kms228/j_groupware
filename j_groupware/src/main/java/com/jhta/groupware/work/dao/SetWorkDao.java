package com.jhta.groupware.work.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.groupware.work.vo.HalfTimeVo;
import com.jhta.groupware.work.vo.WorkTimeVo;

@Repository
public class SetWorkDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE = "com.jhta.groupware.mybatis.SetWorkMapper";
	
	public int updateWorkTime(Map<String, String>map) {
		System.out.println(map);
		return sqlSession.update(NAMESPACE+".updateWorkTime", map);
	}
	public int updateHalfTime(Map<String, String>map) {
		return sqlSession.update(NAMESPACE+".updateHalfTime", map);
	}
	
	public WorkTimeVo selectWorkTime(){
		return sqlSession.selectOne(NAMESPACE+".selectWorkTime");
	}
	public HalfTimeVo selectHalfTime(){
		return sqlSession.selectOne(NAMESPACE+".selectHalfTime");
	}
	
}
