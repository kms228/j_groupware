package com.jhta.groupware.sign.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.groupware.sign.service.SignService;
import com.jhta.groupware.sign.vo.SignNowVo;

@Controller
public class SignNowListController {
	@Autowired private SignService service;
	@RequestMapping("/nowlist")
	public ModelAndView nowlist(HttpServletRequest req) {
		HttpSession session=req.getSession();
		int emp_num=(Integer)session.getAttribute("emp_num");
		ModelAndView mv=new ModelAndView(".sign.sign_now");
		List<SignNowVo> list=service.nowlist(emp_num);
		mv.addObject("list",list);
		System.out.println(list);
		return mv;
	}
}
