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
	//��ٽð� �Է�
	public int insertRequestWorkStart(Map<String, Object> map) {
		System.out.println("------------------RequestWorkDao insert ��--------------------");
		System.out.println("emp_num : "+map.get("emp_num"));
		System.out.println("wlist_start : "+map.get("wlist_start"));
		System.out.println("wlist_type : "+map.get("wlist_type"));
		System.out.println("map.tostring() : "+map.toString());
		System.out.println("------------------RequestWorkDao insert ��--------------------");
		int n =  sqlSession.insert(NAMESPACE+".insertWorkStart", map);
		System.out.println("------------------RequestWorkDao insert ��--------------------");
		System.out.println("emp_num : "+map.get("emp_num"));
		System.out.println("wlist_start : "+map.get("wlist_start"));
		System.out.println("wlist_type : "+map.get("wlist_type"));
		System.out.println("map.tostring() : "+map.toString());
		System.out.println("------------------RequestWorkDao insert ��--------------------");
		return n;
	}
	//��ٽð� �Է�
	public int insertRequestWorkEnd(Map<String, Object>map) {
		return sqlSession.update(NAMESPACE+".insertWorkEnd", map);
	}
	//�ش� ����� ���� ���³ѹ� wlist_num(PK)��������
	public WorkListVo selectRequestWorkNum(Map<String, Object>map) {
		System.out.println("PK���ϱ� ���� map.tostring : "+map.toString());
		WorkListVo vo =  sqlSession.selectOne(NAMESPACE+".selectWorkListNum",map);
		//System.out.println("select PK : "+vo.toString());
		return vo;
	}
	//����ٽð� ��������
	public WorkListVo selectRequestWork(int wlist_num) {
		System.out.println("�ش� �������� ���ϱ� ���� wlist_num(PK)"+wlist_num);
		WorkListVo vo = sqlSession.selectOne(NAMESPACE+".selectWork",wlist_num);
		System.out.println("select worklist : "+vo.toString());
		return vo;
	}
	//������û
	public int insertAnn(Map<String, Object>map) {
		return sqlSession.insert(NAMESPACE+".insertAnn", map);
	}
	//������û(���Ͼ��ε�)
	public int insertAnnFile(Map<String, Object>map) {
		return sqlSession.insert(NAMESPACE+".insertAnnFile", map);
	}
	//������û(�������insert)
	public int insertAnnSign(Map<String, Object>map) {
		return sqlSession.insert(NAMESPACE+".insertAnnSign", map);
	}
	//����(����) ��û ����Ʈ
	public List<WorkandWorkfileVo> selectMyRequest(int emp_num) {
		return sqlSession.selectList(NAMESPACE+".selectMyRequest", emp_num);
	}
	//������û
	public int insertHalf(Map<String, Object>map) {
		return sqlSession.insert(NAMESPACE+".insertHalf", map);
	}
	//��ҽ�û
	public int cancleWork(int work_num) {
		return sqlSession.update(NAMESPACE+".cancleWork", work_num);
	}
	public int cancleWorkLine(int work_num) {
		return sqlSession.update(NAMESPACE+".cancleWorkLine", work_num);
	}
}
