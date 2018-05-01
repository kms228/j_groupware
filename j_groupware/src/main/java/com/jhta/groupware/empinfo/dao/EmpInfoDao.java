package com.jhta.groupware.empinfo.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.groupware.acadeemic.vo.AcademicVo;
import com.jhta.groupware.career.vo.CareerVo;
import com.jhta.groupware.dept.vo.DeptVo;
import com.jhta.groupware.history.vo.HistoryVo;
import com.jhta.groupware.login.vo.LoginVo;
import com.jhta.groupware.position.vo.PositionVo;

@Repository
public class EmpInfoDao {
	@Autowired private SqlSession sqlsession;
	private final String NAMESAPCE="com.jhta.groupware.mybatis.EmpInfoMapper";
	
	public LoginVo getEmp(int EMP_NUM) {
		return sqlsession.selectOne(NAMESAPCE+".getemp", EMP_NUM);
	}
	public AcademicVo getAcad(int EMP_NUM) {
		return sqlsession.selectOne(NAMESAPCE+".getacad", EMP_NUM);
	}
	public CareerVo getCareer(int EMP_NUM) {
		return sqlsession.selectOne(NAMESAPCE+".getcarrer", EMP_NUM);
	}
	public HistoryVo getHis(int EMP_NUM) {
		return sqlsession.selectOne(NAMESAPCE+".gethis", EMP_NUM);
	}
	public PositionVo getPos(int EMP_NUM) {
		return sqlsession.selectOne(NAMESAPCE+".getpos", EMP_NUM);
	}
	public DeptVo getDept(int EMP_NUM) {
		return sqlsession.selectOne(NAMESAPCE+".getdept", EMP_NUM);
	}
	

}










