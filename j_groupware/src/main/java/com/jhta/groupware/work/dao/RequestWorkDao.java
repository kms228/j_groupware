package com.jhta.groupware.work.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.groupware.work.vo.WorkListVo;
import com.jhta.groupware.work.vo.WorkTimeVo;
import com.jhta.groupware.work.vo.WorkandWorkfileVo;

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
	public int insertRequestWorkEnd(Map<String, Object>map) {
		return sqlSession.update(NAMESPACE+".insertWorkEnd", map);
	}
	//해당 사원의 당일 근태넘버 wlist_num(PK)가져오기
	public WorkListVo selectRequestWorkNum(Map<String, Object>map) {
		System.out.println("PK구하기 위한 map.tostring : "+map.toString());
		WorkListVo vo =  sqlSession.selectOne(NAMESPACE+".selectWorkListNum",map);
		//System.out.println("select PK : "+vo.toString());
		return vo;
	}
	//출퇴근시간 가져오기
	public WorkListVo selectRequestWork(int wlist_num) {
		System.out.println("해당 근태정보 구하기 위한 wlist_num(PK)"+wlist_num);
		WorkListVo vo = sqlSession.selectOne(NAMESPACE+".selectWork",wlist_num);
		System.out.println("select worklist : "+vo.toString());
		return vo;
	}
	//연차신청
	public int insertAnn(Map<String, Object>map) {
		return sqlSession.insert(NAMESPACE+".insertAnn", map);
	}
	//연차신청(파일업로드)
	public int insertAnnFile(Map<String, Object>map) {
		return sqlSession.insert(NAMESPACE+".insertAnnFile", map);
	}
	//연차신청(결재순서insert)
	public int insertAnnSign(Map<String, Object>map) {
		return sqlSession.insert(NAMESPACE+".insertAnnSign", map);
	}
	//연차(근태) 신청 리스트
	public List<WorkandWorkfileVo> selectMyRequest(int emp_num) {
		return sqlSession.selectList(NAMESPACE+".selectMyRequest", emp_num);
	}
	//반차신청
	public int insertHalf(Map<String, Object>map) {
		return sqlSession.insert(NAMESPACE+".insertHalf", map);
	}
	//취소신청
	public int cancleWork(int work_num) {
		return sqlSession.update(NAMESPACE+".cancleWork", work_num);
	}
	public int cancleWorkLine(int work_num) {
		return sqlSession.update(NAMESPACE+".cancleWorkLine", work_num);
	}
}
