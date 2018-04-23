package com.jhta.groupware.mem.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.groupware.login.vo.LoginVo;
import com.jhta.groupware.mem.service.MemService;
import com.jhta.groupware.member.vo.MemberAccountVo;

@Controller
public class MemController {
	@Autowired private MemService service;
	@RequestMapping("/memInfo")
	public ModelAndView meminfo(HttpServletRequest req) {
		HttpSession session = req.getSession();
		
		String ACNT_ID=(String)session.getAttribute("ACNT_ID");
		int emp_num=(Integer)session.getAttribute("emp_num");
		
		MemberAccountVo vo1 = service.Accinfo(ACNT_ID);
		LoginVo vo2=service.Empinfo(emp_num);
		
			System.out.println("vo1,vo2가 담겨서 넘어갈예정");
			ModelAndView mv = new ModelAndView();
			mv.setViewName(".login.memInfo");
			mv.addObject("ACNT_ID",vo1.getACNT_id());
			mv.addObject("ACNT_PWD",vo1.getACNT_pwd());
			mv.addObject("EMP_NUM", vo2.getEMP_NUM());
			mv.addObject("EMP_NAME", vo2.getEMP_NAME());
			mv.addObject("EMP_PHONE", vo2.getEMP_PHONE());
			mv.addObject("EMP_BIRTH", vo2.getEMP_BIRTH());
			mv.addObject("EMP_EMAIL", vo2.getEMP_EMAIL());
			mv.addObject("EMP_GENDER", vo2.getEMP_GENDER());
			mv.addObject("EMP_ADDR", vo2.getEMP_ADDR());
			return mv;
	}
	@RequestMapping(value="/memUpdate", method=RequestMethod.POST)
	public String memUpdate(String ACNT_ID,String ACNT_PWD,String EMP_PHONE,int EMP_NUM,
			String EMP_ADDR,String EMP_NAME,String EMP_GENDER,String EMP_EMAIL,HttpSession session) {
		HashMap<String,Object> map1=new HashMap<String, Object>();
		HashMap<String,Object> map2=new HashMap<String, Object>();
		map1.put("ACNT_ID",ACNT_ID);
		map1.put("ACNT_PWD",ACNT_PWD);
		map2.put("EMP_NUM",EMP_NUM);
		map2.put("EMP_NAME",EMP_NAME);
		map2.put("EMP_PHONE",EMP_PHONE);
		map2.put("EMP_ADDR",EMP_ADDR);
		//map.put("EMP_BIRTH",EMP_BIRTH);
		map2.put("EMP_EMAIL",EMP_EMAIL);
		map2.put("EMP_GENDER",EMP_GENDER);
		try {
			service.AcUpdate(map1);
			service.EmpUpdate(map2);
			System.out.println("성공");
			return ".login.login2";
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("실패");
			return "redirect";
		}
	}
}
	





	
	
	
	
	
	
	
	
