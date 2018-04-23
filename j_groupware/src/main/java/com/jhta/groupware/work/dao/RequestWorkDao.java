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
	//��ٽð� �Է�
	public int insertRequestWorkStart(Map<String, Object> map) {
		System.out.println("------------------RequestWorkDao insert ��--------------------");
		System.out.println("emp_num : "+map.get("emp_num"));
		System.out.println("wlist_start : "+map.get("wlist_start"));
		System.out.println("wlist_type : "+map.get("wlist_type"));
		System.out.println("map.tostring() : "+map.toString());
		System.out.println("emp_num Ÿ�� : "+map.get("emp_num").getClass().getName());
		System.out.println("wlist_start Ÿ�� : "+map.get("wlist_start").getClass().getName());
		System.out.println("wlist_type Ÿ�� : "+map.get("wlist_type").getClass().getName());
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
	public void insertRequestWorkEnd() {
		
	}
	//����� ���/��� �ð� ��������
	public WorkListVo selectRequestWork(Map<String, Object>map) {
		return sqlSession.selectOne(NAMESPACE+".selectWorkList",map);
	}
	//��ٽð� ��������
	public void selectRequestWorkEnd() {
		
	}
	//��ٽð� ��������
	public void selectRequestWorkStart() {
		
	}
}
