package com.jhta.groupware.sign.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.groupware.sign.service.SignService;
import com.jhta.groupware.sign.vo.DocTypeVo;

@Controller
public class SignWriteController {
	@Autowired private SignService service;
	@RequestMapping("/signwrite")
	public ModelAndView signwrite(int num) {
		System.out.println(num);
		DocTypeVo vo=service.getdoc(num);
		System.out.println(vo);
		ModelAndView mv=new ModelAndView(".sign.sign_write");
		mv.addObject("vo",vo);
		return mv;
	}
	
	@RequestMapping("/addsign")
	public String addsign(String ir1) {
		System.out.println(ir1);
		return ".sign.sign_main";
	}
	
}
