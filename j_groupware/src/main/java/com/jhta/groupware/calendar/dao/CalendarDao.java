package com.jhta.groupware.calendar.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.groupware.calendar.vo.Sc_FileVo;
import com.jhta.groupware.calendar.vo.ScheduleVo;

@Repository
public class CalendarDao {
	@Autowired private SqlSession session;
	private final String NAMESPACE = "com.jhta.groupware.mybatis.CalendarMapper";

	public int getSch_num(int emp_num) {
		return session.selectOne(NAMESPACE+".getSch_num",emp_num);
	}
	public int insertSchedule(ScheduleVo vo) {
		return session.insert(NAMESPACE+".insertSchedule",vo);
	}
	public int sc_File(Sc_FileVo vo) {
		return session.insert(NAMESPACE+".insertSc_file",vo);
	}
	
}
