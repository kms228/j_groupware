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
	//����������
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
	
	//�� ���繮�� ���
	public int addsigndoc(SignVo vo) {
		return sqlSession.insert(NAMESPACE+".addsigndoc",vo);
	}
	//�� ������� ���
	public int addsdocline(SdocLineVo vo) {
		return sqlSession.insert(NAMESPACE+".addsignline",vo);
	}
	//���� ������ ������ȣ ������
	public List<SdocLineVo> mysigndoc(int emp_num){
		return sqlSession.selectList(NAMESPACE+".mysigndoc",emp_num);
	}
	//���� ������ �������� ������
	public SignNowVo getsigndoc(int sdoc_num) {
		return sqlSession.selectOne(NAMESPACE+".getsigndoc",sdoc_num);
	}
	//���� ���๮�� �󼼺���
	public SignVo getnowdoc(int sdoc_num) {
		return sqlSession.selectOne(NAMESPACE+".getnowdoc",sdoc_num);
	}
	//���๮�� �󼼺����� ������� ������
	public List<SdocLineVo> getsignline(int sdoc_num){
		return sqlSession.selectList(NAMESPACE+".getsignline",sdoc_num);
	}
	//���๮�� �󼼺����� ������ο� ���� ������ ������� �߰��� ������
	public SignLineListVo getempinfo(int emp_num) {
		return sqlSession.selectOne(NAMESPACE+".getempinfo",emp_num);
	}
}
