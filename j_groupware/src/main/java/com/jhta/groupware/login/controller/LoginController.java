package com.jhta.groupware.login.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.groupware.login.service.LoginService;
import com.jhta.groupware.member.vo.MemberAccountVo;

@Controller
public class LoginController {
	@Autowired
	private LoginService service;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return ".login.login1";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginOk(String ACNT_ID, String ACNT_PWD, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("ACNT_ID", ACNT_ID);
		map.put("ACNT_PWD", ACNT_PWD);
		boolean n = service.login(map);
		if (n) {
			MemberAccountVo vo = new MemberAccountVo();
			System.out.println(ACNT_ID);
			System.out.println("된다!!!");
			session.setAttribute("ACNT_ID", ACNT_ID);
			return "redirect:/";
		} else {
			System.out.println("안되!!!");
			return ".login.login1";
		}
	}

	@RequestMapping(value = "/logout")
	public ModelAndView logOut(ModelAndView mv, HttpSession session) {
		String page = "redirect:/";
		session.removeAttribute("ACNT_ID");
		mv.setViewName(page);
		return mv;
	}
}
