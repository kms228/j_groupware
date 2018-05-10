package com.jhta.groupware.work.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.groupware.work.vo.RequestListVo;
import com.jhta.groupware.work.vo.SearchResponseListVo;
import com.jhta.groupware.work.vo.Work_LineVo;
import com.jhta.groupware.work.vo.Work_TypeVo;

@Repository
public class ResponseWorkListDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE = "com.jhta.groupware.mybatis.work.ResponseWorkListMapper";
	
	//근태신청 타입리스트부르기
	public List<Work_TypeVo> selectWorkType() {
		return sqlSession.selectList(NAMESPACE+".selectWorkType");
	}
	//신청한 근태 리스트
	public List<SearchResponseListVo> selectResponseList(Map<String, Object>map){
		return sqlSession.selectList(NAMESPACE+".selectResponseList", map);
	}
	//승인
	public int accept(int wline_num) {
		return sqlSession.update(NAMESPACE+".accept", wline_num);
	}
	
	//최종승인 준비
	public List<Work_LineVo> prepFinalAccept(int wline_num){
		return sqlSession.selectList(NAMESPACE+".prepFinalAccept", wline_num);
	}
	
	//최종승인
	public int finalAccept(int wline_num) {
		return sqlSession.update(NAMESPACE+".finalAccept", wline_num);
	}
	
	//반려
	public int unaccept(int wline_num) {
		return sqlSession.update(NAMESPACE+".unaccept", wline_num);
	}
	
	//최종반려
	public int finalUnaccept(int wline_num) {
		return sqlSession.update(NAMESPACE+".finalUnaccept", wline_num);
	}
}
