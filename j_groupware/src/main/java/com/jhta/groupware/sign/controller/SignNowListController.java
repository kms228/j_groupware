package com.jhta.groupware.sign.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.groupware.sign.service.SignService;
import com.jhta.groupware.sign.vo.SignVo;

@Controller
public class SignNowListController {
	@Autowired private SignService service;
	@RequestMapping("/nowlist")
	public ModelAndView nowlist() {
		System.out.println("nowlist");
		ModelAndView mv=new ModelAndView(".sign.sign_now");
		List<SignVo> list=service.nowlist();
		mv.addObject("list",list);
		System.out.println(list);
		return mv;
	}
}
