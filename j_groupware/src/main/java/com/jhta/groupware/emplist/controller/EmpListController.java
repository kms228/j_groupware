package com.jhta.groupware.emplist.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.groupware.acadeemic.vo.AcademicVo;
import com.jhta.groupware.career.vo.CareerVo;
import com.jhta.groupware.dept.vo.DeptVo;
import com.jhta.groupware.empinfo.service.EmpInfoService;
import com.jhta.groupware.emplist.service.EmpListService;
import com.jhta.groupware.emplist.vo.EmpListVo;
import com.jhta.groupware.history.vo.HistoryVo;
import com.jhta.groupware.login.vo.LoginVo;
import com.jhta.groupware.member.vo.MemberAccountVo;
import com.jhta.groupware.position.vo.PositionVo;

@Controller
public class EmpListController {
	@Autowired
	private EmpListService service;
	@Autowired
	private EmpInfoService service2;
	
	@RequestMapping("/emplist")
	public ModelAndView emplist(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView(".login.emplist");
		//HttpSession session=req.getSession();	
		List<EmpListVo> emplist=service.getList();
		mv.addObject("list",emplist);
		System.out.println("List controller");
		return mv;
	}
	@RequestMapping("/empselect")
	public ModelAndView empselect(int EMP_NUM) {
		ModelAndView mv =new ModelAndView(".login.empSelectView");
		System.out.println(EMP_NUM+"조회할 회원번호");
		// 1.사원개인정보
		LoginVo vo1=service2.getEmp(EMP_NUM);
		// 2.계정정보
		MemberAccountVo vo2=service2.getAcc(EMP_NUM);
		// 3.부서정보
		DeptVo vo3=service2.getDept(EMP_NUM);
		// 4.직위정보
		PositionVo vo4=service2.getPos(EMP_NUM);
		// 5.학력정보
		List<AcademicVo> vo5=service2.getAcad(EMP_NUM);
		// 6.경력정보
		List<CareerVo> vo6=service2.getCareer(EMP_NUM);
		// 7.근무이력
		List<HistoryVo> vo7=service2.getHis(EMP_NUM);
		
		mv.addObject("vo1", vo1);
		mv.addObject("vo2", vo2);
		mv.addObject("vo3", vo3);
		mv.addObject("vo4", vo4);
		mv.addObject("vo5", vo5);
		mv.addObject("vo6", vo6);
		mv.addObject("vo7", vo7);
		return mv;
	}
	@RequestMapping("/updateEmp")
	public String updateEmp(int EMP_NUM,String EMP_NAME,String EMP_GENDER,String EMP_PHONE,String EMP_EMAIL,
				String EMP_BIRTH,String EMP_HIREDATE,String EMP_ADDR,int DEPT_NUM,int PST_NUM) {
		
		HashMap<String,Object>map = new HashMap<>();
		map.put("EMP_NUM",EMP_NUM);
		map.put("EMP_NAME",EMP_NAME);
		map.put("EMP_PHONE",EMP_PHONE);
		map.put("EMP_EMAIL",EMP_EMAIL);
		map.put("EMP_BIRTH",EMP_BIRTH);
		map.put("EMP_GENDER",EMP_GENDER);
		map.put("EMP_HIREDATE",EMP_HIREDATE);
		map.put("EMP_ADDR",EMP_ADDR);
		map.put("DEPT_NUM",DEPT_NUM);
		map.put("PST_NUM",PST_NUM);
		
		int n = service.updateEmp(map);
		if(n>0) {
			System.out.println(n+"n이 뭘까?");
			return "redirect:/emplist";
		}else {
			System.out.println(n+"뭐가 넘어오나?");
			return "redirect:/emplist";
		}
		
	}
	
}









