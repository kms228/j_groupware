package com.jhta.groupware.emplist.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.groupware.empinfo.service.EmpInfoService;
import com.jhta.groupware.emplist.service.EmpListService;
import com.jhta.groupware.emplist.vo.EmpListVo;

@Controller
public class RetireListController {
	@Autowired
	private EmpListService service;
	@Autowired
	private EmpInfoService service2;
	
	@RequestMapping("/retirelist")
	public ModelAndView retirelist(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView(".login.retireList");
		List<EmpListVo> retire=service.retireList(); 
		mv.addObject("list",retire);
		System.out.println("List controller");
		return mv;
	}
}
