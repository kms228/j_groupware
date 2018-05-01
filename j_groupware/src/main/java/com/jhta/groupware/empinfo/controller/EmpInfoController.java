package com.jhta.groupware.empinfo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.groupware.acadeemic.vo.AcademicVo;
import com.jhta.groupware.career.vo.CareerVo;
import com.jhta.groupware.dept.vo.DeptVo;
import com.jhta.groupware.empinfo.service.EmpInfoService;
import com.jhta.groupware.history.vo.HistoryVo;
import com.jhta.groupware.login.vo.LoginVo;
import com.jhta.groupware.position.vo.PositionVo;

@Controller
public class EmpInfoController {
	@Autowired 
	private EmpInfoService service;
	
	@RequestMapping(value="/empinfo",method=RequestMethod.GET)
	public ModelAndView empinfo(int EMP_NUM) {
		ModelAndView mv = new ModelAndView(".login.empinfo");
		
		LoginVo vo1 = service.getEmp(EMP_NUM);
		AcademicVo vo2=service.getAcad(EMP_NUM);
		CareerVo vo3=service.getCareer(EMP_NUM);
		HistoryVo vo4=service.getHis(EMP_NUM);
		PositionVo vo5=service.getPos(EMP_NUM);
		DeptVo vo6=service.getDept(EMP_NUM);
		
		mv.addObject("vo1",vo1);
		mv.addObject("vo2",vo2);
		mv.addObject("vo3",vo3);
		mv.addObject("vo4",vo4);
		mv.addObject("vo5",vo5);
		mv.addObject("vo6",vo6);
		
		return mv;
	}
}
  