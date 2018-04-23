package com.jhta.groupware.sign.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.groupware.sign.service.SignService;
import com.jhta.groupware.sign.vo.SdocLineVo;
import com.jhta.groupware.sign.vo.SignLineDocVo;
import com.jhta.groupware.sign.vo.SignNowVo;

@Controller
public class SignListController {
	@Autowired private SignService service;
	
	/*@RequestMapping("/signlist")
	public ModelAndView signlist(HttpServletRequest req) {
		ModelAndView mv=new ModelAndView(".sign.sign_list");
		HttpSession session=req.getSession();
		int emp_num=(Integer)session.getAttribute("emp_num");
		List<SdocLineVo> list=service.mysigndoc(emp_num);
		ArrayList<SignNowVo> signnow=new ArrayList<SignNowVo>();
		for(int i=0;i<list.size();i++) {
			SdocLineVo vo=list.get(i);
			int sdoc_num=vo.getSdoc_num();
			SignNowVo signdoc=service.getsignnow(sdoc_num);
			signnow.add(signdoc);
		}
		mv.addObject("signnow",signnow);
		return mv;
	}*/
	
	@RequestMapping("/signlist")
	public ModelAndView signlist(HttpServletRequest req) {
		ModelAndView mv=new ModelAndView(".sign.sign_list");
		HttpSession session=req.getSession();
		int emp_num=(Integer)session.getAttribute("emp_num");
		List<SignLineDocVo> list =  service.linesigndoc(emp_num);
		System.out.println(list);
		mv.addObject("signnow",list);
		return mv;
	}
}
