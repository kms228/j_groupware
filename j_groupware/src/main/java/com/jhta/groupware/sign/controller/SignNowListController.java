package com.jhta.groupware.sign.controller;

import java.net.Socket;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.groupware.sign.service.SignService;
import com.jhta.groupware.sign.vo.SdocLineVo;
import com.jhta.groupware.sign.vo.SignLineListVo;
import com.jhta.groupware.sign.vo.SignNowVo;
import com.jhta.groupware.sign.vo.SignVo;

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
	
	@RequestMapping("/signnowdetail")
	public ModelAndView signnowdetail(int sdoc_num,HttpServletRequest req) {
		ModelAndView mv=new ModelAndView(".sign.sign_nowdetail");
		SignVo signdetail=service.getnowdoc(sdoc_num);
		List<SdocLineVo> sdocline=service.getsignline(sdoc_num);
		System.out.println(sdocline);
		for(int i=0;i<sdocline.size();i++) {
			SdocLineVo vo=sdocline.get(i);
			int emp_num=vo.getEmp_num();
			//결재라인 사원정보 추가로 얻어오기
			SignLineListVo info=service.getempinfo(emp_num);
			vo.setEmp_name(info.getEmp_name());
			vo.setPst_name(info.getPst_name());
			sdocline.set(i, vo);
		}
		System.out.println(sdocline);
		mv.addObject("signdetail",signdetail);
		mv.addObject("sdocline",sdocline);
		return mv;
	}
	
	//결재문서함 디테일
	@RequestMapping("/signdetail")
	public ModelAndView signdetail(int sdoc_num,HttpServletRequest req) {
		ModelAndView mv=new ModelAndView(".sign.sign_signdetail");
		SignVo signdetail=service.getnowdoc(sdoc_num);
		List<SdocLineVo> sdocline=service.getsignline(sdoc_num);
		System.out.println(sdocline);
		for(int i=0;i<sdocline.size();i++) {
			SdocLineVo vo=sdocline.get(i);
			int emp_num=vo.getEmp_num();
			//결재라인 사원정보 추가로 얻어오기
			SignLineListVo info=service.getempinfo(emp_num);
			vo.setEmp_name(info.getEmp_name());
			vo.setPst_name(info.getPst_name());
			sdocline.set(i, vo);
		}
		System.out.println(sdocline);
		mv.addObject("signdetail",signdetail);
		mv.addObject("sdocline",sdocline);
		return mv;
	}
	
	@RequestMapping("/signOk")
	public String signOk(int sline_num,HttpServletRequest req) {
		HttpSession session=req.getSession();
		HashMap<String, Object> map=new HashMap<>();
		int emp_num=(Integer)session.getAttribute("emp_num");
		map.put("sline_num", sline_num);
		map.put("emp_num",emp_num);
		
		service.signOk(map);
		
		return "redirect:/nowlist";
	}
	
	
}
