package com.jhta.groupware.work.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.groupware.work.vo.WorkListVo;
import com.jhta.groupware.work.vo.WorkTimeVo;

@Repository
public class RequestWorkDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE = "com.jhta.groupware.mybatis.work.RequestWorkMapper";
	//출근시간 입력
	public int insertRequestWorkStart(Map<String, Object> map) {
		System.out.println("------------------RequestWorkDao insert 전--------------------");
		System.out.println("emp_num : "+map.get("emp_num"));
		System.out.println("wlist_start : "+map.get("wlist_start"));
		System.out.println("wlist_type : "+map.get("wlist_type"));
		System.out.println("map.tostring() : "+map.toString());
		System.out.println("emp_num 타입 : "+map.get("emp_num").getClass().getName());
		System.out.println("wlist_start 타입 : "+map.get("wlist_start").getClass().getName());
		System.out.println("wlist_type 타입 : "+map.get("wlist_type").getClass().getName());
		System.out.println("------------------RequestWorkDao insert 전--------------------");
		int n =  sqlSession.insert(NAMESPACE+".insertWorkStart", map);
		System.out.println("------------------RequestWorkDao insert 후--------------------");
		System.out.println("emp_num : "+map.get("emp_num"));
		System.out.println("wlist_start : "+map.get("wlist_start"));
		System.out.println("wlist_type : "+map.get("wlist_type"));
		System.out.println("map.tostring() : "+map.toString());
		System.out.println("------------------RequestWorkDao insert 후--------------------");
		return n;
	}
	//퇴근시간 입력
	public void insertRequestWorkEnd() {
		
	}
	//저장된 출근/퇴근 시간 가져오기
	public WorkListVo selectRequestWork(Map<String, Object>map) {
		return sqlSession.selectOne(NAMESPACE+".selectWorkList",map);
	}
	//퇴근시간 가져오기
	public void selectRequestWorkEnd() {
		
	}
	//출근시간 가져오기
	public void selectRequestWorkStart() {
		
	}
}
