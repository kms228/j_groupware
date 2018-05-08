package com.jhta.groupware.empinfo.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.groupware.acadeemic.vo.AcademicVo;
import com.jhta.groupware.career.vo.CareerVo;
import com.jhta.groupware.dept.vo.DeptVo;
import com.jhta.groupware.history.vo.HistoryVo;
import com.jhta.groupware.login.vo.LoginVo;
import com.jhta.groupware.member.vo.MemberAccountVo;
import com.jhta.groupware.position.vo.PositionVo;

@Repository
public class EmpInfoDao {
	@Autowired private SqlSession sqlsession;
	private final String NAMESAPCE="com.jhta.groupware.mybatis.EmpInfoMapper";
	
	public LoginVo getEmp(int EMP_NUM) {
		return sqlsession.selectOne(NAMESAPCE+".getemp", EMP_NUM);
	}
	public List<AcademicVo> getAcad(int EMP_NUM) {
		System.out.println("dao");
		return sqlsession.selectList(NAMESAPCE+".getacad", EMP_NUM);
	}
	public List<CareerVo> getCareer(int EMP_NUM) {
		System.out.println("dao getCareer");
		return sqlsession.selectList(NAMESAPCE+".getcarrer", EMP_NUM);
	}
	public List<HistoryVo> getHis(int EMP_NUM) {
		return sqlsession.selectList(NAMESAPCE+".gethis", EMP_NUM);
	}
	public PositionVo getPos(int EMP_NUM) {
		return sqlsession.selectOne(NAMESAPCE+".getpos", EMP_NUM);
	}
	public DeptVo getDept(int EMP_NUM) {
		return sqlsession.selectOne(NAMESAPCE+".getdept", EMP_NUM);
	}
	public MemberAccountVo getAcc(int EMP_NUM) {
		return sqlsession.selectOne(NAMESAPCE+".getacc", EMP_NUM);
	}
	//삭제
	public int delete(int ACD_NUM) {
		return sqlsession.delete(NAMESAPCE+".delaca",ACD_NUM);
	}
	//추가
	public int insertacc(HashMap<String,Object>map) {
		return sqlsession.insert(NAMESAPCE+".insertacc",map);
	}
	//경력////////////////////
	//삭제
	public int deletecar(int CRR_NUM) {
		return sqlsession.delete(NAMESAPCE+".delcar",CRR_NUM);
	}
	//추가
	public int insertcar(HashMap<String,Object>map) {
		return sqlsession.insert(NAMESAPCE+".insertcar",map);
	}
	//근무////////////////////
	//삭제
	public int deletehis(int HIS_NUM) {
	return sqlsession.delete(NAMESAPCE+".delhis",HIS_NUM);
	}
	//추가
	public int inserthis(HashMap<String,Object>map) {
	return sqlsession.insert(NAMESAPCE+".inserthis",map);
	}

}










