package com.jhta.groupware.empinfo.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.groupware.acadeemic.vo.AcademicVo;
import com.jhta.groupware.career.vo.CareerVo;
import com.jhta.groupware.dept.vo.DeptVo;
import com.jhta.groupware.empinfo.dao.EmpInfoDao;
import com.jhta.groupware.history.vo.HistoryVo;
import com.jhta.groupware.login.vo.LoginVo;
import com.jhta.groupware.position.vo.PositionVo;

@Service
public class EmpInfoService {
	@Autowired
	private EmpInfoDao dao;
	
	public LoginVo getEmp(int EMP_NUM) {
		LoginVo vo1 = dao.getEmp(EMP_NUM);
		return vo1;
	}
	public AcademicVo getAcad(int EMP_NUM) {
		AcademicVo vo2=dao.getAcad(EMP_NUM);
		return vo2;
	}
	public CareerVo getCareer(int EMP_NUM) {
		CareerVo vo3=dao.getCareer(EMP_NUM);
		return vo3;
	}
	public HistoryVo getHis(int EMP_NUM) {
		HistoryVo vo4=dao.getHis(EMP_NUM);
		return vo4;
	}
	public PositionVo getPos(int EMP_NUM) {
		PositionVo vo5=dao.getPos(EMP_NUM);
		return vo5;
	}
	public DeptVo getDept(int EMP_NUM) {
		DeptVo vo5=dao.getDept(EMP_NUM);
		return vo5;
	}
	
}















