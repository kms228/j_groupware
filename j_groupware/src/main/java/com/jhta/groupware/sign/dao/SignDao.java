package com.jhta.groupware.sign.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.groupware.sign.vo.DocTypeVo;
import com.jhta.groupware.sign.vo.SdocLineVo;
import com.jhta.groupware.sign.vo.SignLineListVo;
import com.jhta.groupware.sign.vo.SignNowVo;
import com.jhta.groupware.sign.vo.SignVo;

@Repository
public class SignDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="com.jhta.groupware.mybatis.SignMapper";
	//문서얻어오기
	public DocTypeVo getdoc(int num) {
		return sqlSession.selectOne(NAMESPACE+".getdoc",num);
	}

	public List<SignNowVo> nowlist(int emp_num){
		return sqlSession.selectList(NAMESPACE+".nowlist",emp_num);
	}
	
	public List<SignLineListVo> signlinelist() {
		return sqlSession.selectList(NAMESPACE+".signlinelist");
	}
	
	public List<SignLineListVo> deptlist(){
		return sqlSession.selectList(NAMESPACE+".deptlist");
	}
	
	//새 결재문서 등록
	public int addsigndoc(SignVo vo) {
		return sqlSession.insert(NAMESPACE+".addsigndoc",vo);
	}
	//새 결재라인 등록
	public int addsdocline(SdocLineVo vo) {
		return sqlSession.insert(NAMESPACE+".addsignline",vo);
	}
}
