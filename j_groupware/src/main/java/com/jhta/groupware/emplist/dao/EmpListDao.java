package com.jhta.groupware.emplist.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.groupware.emplist.vo.EmpListVo;

@Repository
public class EmpListDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="com.jhta.groupware.mybatis.EmpListMapper";
	
	public List<EmpListVo> getList(){
		System.out.println("EmpList Dao");
		return sqlSession.selectList(NAMESPACE+".getlist");
	}
	public List<EmpListVo> retireList(){
		System.out.println("RetireList Dao");
		return sqlSession.selectList(NAMESPACE+".retirelist");
	}
	public int updateEmp(HashMap<String,Object>map) {
		return sqlSession.update(NAMESPACE+".updateEmp", map);
	}
	public int updateAcc(HashMap<String,Object>map) {
		return sqlSession.update(NAMESPACE+".updateAcc", map);
	}
	public int insertRe(HashMap<String,Object>map) {
		return sqlSession.update(NAMESPACE+".insertRe", map);
	}
}
