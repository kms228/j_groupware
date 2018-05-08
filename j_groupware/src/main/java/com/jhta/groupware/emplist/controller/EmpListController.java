package com.jhta.groupware.emplist.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.groupware.empinfo.service.EmpInfoService;

@Controller
public class EmpListController {
	@Autowired 
	private EmpInfoService service;
	
	@RequestMapping(value="/emplist",method=RequestMethod.GET)
	public ModelAndView emplist(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView("/login/emplist");
		HttpSession session = req.getSession();
		int EMP_NUM=(Integer)session.getAttribute("emp_num");
		System.out.println(EMP_NUM);
		
		// 여기 값 받아와서 써야함
		
		return mv;
	}
}
