package com.jhta.groupware.empinfo.service;


import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.groupware.acadeemic.vo.AcademicVo;
import com.jhta.groupware.career.vo.CareerVo;
import com.jhta.groupware.dept.vo.DeptVo;
import com.jhta.groupware.empinfo.dao.EmpInfoDao;
import com.jhta.groupware.history.vo.HistoryVo;
import com.jhta.groupware.login.vo.LoginVo;
import com.jhta.groupware.member.vo.MemberAccountVo;
import com.jhta.groupware.position.vo.PositionVo;

@Service
public class EmpInfoService {
	@Autowired
	private EmpInfoDao dao;
	
	public LoginVo getEmp(int EMP_NUM) {
		LoginVo vo1 = dao.getEmp(EMP_NUM);
		return vo1;
	}
	public List<AcademicVo> getAcad(int EMP_NUM) {
		System.out.println("service");
		List<AcademicVo> vo2=dao.getAcad(EMP_NUM);
		return vo2;
	}
	public List<CareerVo> getCareer(int EMP_NUM) {
		System.out.println("service getCareer");
		List<CareerVo> vo3=dao.getCareer(EMP_NUM);
		return vo3;
	}
	public List<HistoryVo> getHis(int EMP_NUM) {
		List<HistoryVo> vo4=dao.getHis(EMP_NUM);
		return vo4;
	}
	public PositionVo getPos(int EMP_NUM) {
		PositionVo vo5=dao.getPos(EMP_NUM);
		return vo5;
	}
	public DeptVo getDept(int EMP_NUM) {
		DeptVo vo6=dao.getDept(EMP_NUM);
		return vo6;
	}
	public MemberAccountVo getAcc(int EMP_NUM) {
		MemberAccountVo vo7=dao.getAcc(EMP_NUM);
		return vo7;
	}
	//학력삭제
	public int delete(int ACD_NUM) {
		return dao.delete(ACD_NUM);
	}
	//학력추가
	public int insertacc(HashMap<String,Object>map) {
		return dao.insertacc(map);
	}
	
	///////////////////////
	//경력삭제
	public int deletecar(int CRR_NUM) {
	return dao.deletecar(CRR_NUM);
	}
	//경력추가
	public int insertcar(HashMap<String,Object>map) {
	return dao.insertcar(map);
	}
	///////////////////////
	//근무이력삭제
	public int deletehis(int HIS_NUM) {
	return dao.deletehis(HIS_NUM);
	}
	//근무이력추가
	public int inserthis(HashMap<String,Object>map) {
	return dao.inserthis(map);
	}
	
}















