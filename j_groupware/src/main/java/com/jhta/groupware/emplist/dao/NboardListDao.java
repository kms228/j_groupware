package com.jhta.groupware.emplist.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.groupware.emplist.vo.NboardListVo;

@Repository
public class NboardListDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="com.jhta.groupware.mybatis.NboardListMapper";
	
	public List<NboardListVo> getList(){
		System.out.println("dao");
		return sqlSession.selectList(NAMESPACE+".getList");
	}
	public NboardListVo getSelectNboard(int B_NUM) {
		return sqlSession.selectOne(NAMESPACE+".getNboard",B_NUM);
	}
	public int insertNboard(HashMap<String, Object> map) {
		return sqlSession.insert(NAMESPACE+".insertNboard", map);
	}
	

}
