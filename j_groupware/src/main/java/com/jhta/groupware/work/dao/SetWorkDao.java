package com.jhta.groupware.work.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.groupware.dept.vo.DeptVo;
import com.jhta.groupware.work.vo.AnnInfoVo;
import com.jhta.groupware.work.vo.HalfTimeVo;
import com.jhta.groupware.work.vo.SearchAdminVo;
import com.jhta.groupware.work.vo.SearchAnnVo;
import com.jhta.groupware.work.vo.WorkTimeVo;

@Repository
public class SetWorkDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE = "com.jhta.groupware.mybatis.work.SetWorkMapper";
	
	public int updateWorkTime(Map<String, String>map) {
		System.out.println(map);
		return sqlSession.update(NAMESPACE+".updateWorkTime", map);
	}
	public int updateHalfTime(Map<String, String>map) {
		return sqlSession.update(NAMESPACE+".updateHalfTime", map);
	}
	//출근지정시간 가져오기
	public WorkTimeVo selectWorkTime(){
		return sqlSession.selectOne(NAMESPACE+".selectWorkTime");
	}
	//반차지정시간 가져오기
	public HalfTimeVo selectHalfTime(){
		return sqlSession.selectOne(NAMESPACE+".selectHalfTime");
	}
	//연차정보가져오기
	public List<SearchAnnVo> selectAnnIfo(Map<String, Object> map){
		return sqlSession.selectList(NAMESPACE+".selectAnnInfo", map);
	}
	//부서종류 가져오기
	public List<DeptVo> getDept(){
		return sqlSession.selectList(NAMESPACE+".getDept");
	}
	//검색 : 연자정보가져오기
	public List<SearchAnnVo> searchAnn(Map<String, Object>map){
		return sqlSession.selectList(NAMESPACE+".searchAnn",map);
	}
	//연차 수정 및 등록
	public int updateAnn(Map<String, Object>map) {
		return sqlSession.update(NAMESPACE+".updateAnn", map);
	}
	
	//관리자 검색
	public List<SearchAdminVo> searchAdmin(){
		return sqlSession.selectList(NAMESPACE+".searchAdmin");
	}
	//관리자 수여
	public int updateAdmin(Map<String, Object>map) {
		return sqlSession.update(NAMESPACE+".updateAdmin", map);
	}
	//관리자 박탈
	public int cancleAdmin(Map<String, Object>map) {
		return sqlSession.update(NAMESPACE+".cancleAdmin", map);
	}
	//저장전 관리자 검색
	public SearchAdminVo beforeAdmin(Map<String, Object>map){
		return sqlSession.selectOne(NAMESPACE+".beforeAdmin", map);
	}
}
