package com.jhta.groupware.home.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.groupware.home.vo.MyProfileVo;
import com.jhta.groupware.home.vo.MyScheduleVo;
import com.jhta.groupware.home.vo.MyWorkListVo;

@Repository
public class HomeDao {
	@Autowired private SqlSession session;
	private final String NAMESPACE = "com.jhta.groupware.mybatis.HomeMapper";
	
	public MyProfileVo getMyProfile(String acnt_id) {
		System.out.println("acnt_id:::"+acnt_id);
		return session.selectOne(NAMESPACE+".getMyProfile",acnt_id);
	}

	public List<MyScheduleVo> getMySchedule(String acnt_id) {
		return session.selectList(NAMESPACE+".getMySchedule",acnt_id);
	}

	public List<MyWorkListVo> getMyWorkList(String acnt_id) {
		return session.selectList(NAMESPACE+".getMyWorkList",acnt_id);
	}
}
