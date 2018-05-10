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
	
	//���½�û Ÿ�Ը���Ʈ�θ���
	public List<Work_TypeVo> selectWorkType() {
		return sqlSession.selectList(NAMESPACE+".selectWorkType");
	}
	//��û�� ���� ����Ʈ
	public List<SearchResponseListVo> selectResponseList(Map<String, Object>map){
		return sqlSession.selectList(NAMESPACE+".selectResponseList", map);
	}
	//����
	public int accept(int wline_num) {
		return sqlSession.update(NAMESPACE+".accept", wline_num);
	}
	
	//�������� �غ�
	public List<Work_LineVo> prepFinalAccept(int wline_num){
		return sqlSession.selectList(NAMESPACE+".prepFinalAccept", wline_num);
	}
	
	//��������
	public int finalAccept(int wline_num) {
		return sqlSession.update(NAMESPACE+".finalAccept", wline_num);
	}
	
	//�ݷ�
	public int unaccept(int wline_num) {
		return sqlSession.update(NAMESPACE+".unaccept", wline_num);
	}
	
	//�����ݷ�
	public int finalUnaccept(int wline_num) {
		return sqlSession.update(NAMESPACE+".finalUnaccept", wline_num);
	}
}
