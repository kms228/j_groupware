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
	//��������ð� ��������
	public WorkTimeVo selectWorkTime(){
		return sqlSession.selectOne(NAMESPACE+".selectWorkTime");
	}
	//���������ð� ��������
	public HalfTimeVo selectHalfTime(){
		return sqlSession.selectOne(NAMESPACE+".selectHalfTime");
	}
	//����������������
	public List<SearchAnnVo> selectAnnIfo(Map<String, Object> map){
		return sqlSession.selectList(NAMESPACE+".selectAnnInfo", map);
	}
	//�μ����� ��������
	public List<DeptVo> getDept(){
		return sqlSession.selectList(NAMESPACE+".getDept");
	}
	//�˻� : ����������������
	public List<SearchAnnVo> searchAnn(Map<String, Object>map){
		return sqlSession.selectList(NAMESPACE+".searchAnn",map);
	}
	//���� ���� �� ���
	public int updateAnn(Map<String, Object>map) {
		return sqlSession.update(NAMESPACE+".updateAnn", map);
	}
	
	//������ �˻�
	public List<SearchAdminVo> searchAdmin(){
		return sqlSession.selectList(NAMESPACE+".searchAdmin");
	}
	//������ ����
	public int updateAdmin(Map<String, Object>map) {
		return sqlSession.update(NAMESPACE+".updateAdmin", map);
	}
	//������ ��Ż
	public int cancleAdmin(Map<String, Object>map) {
		return sqlSession.update(NAMESPACE+".cancleAdmin", map);
	}
	//������ ������ �˻�
	public SearchAdminVo beforeAdmin(Map<String, Object>map){
		return sqlSession.selectOne(NAMESPACE+".beforeAdmin", map);
	}
}
