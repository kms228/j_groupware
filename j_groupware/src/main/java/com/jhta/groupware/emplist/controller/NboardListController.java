package com.jhta.groupware.emplist.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.groupware.emplist.service.NboardListService;
import com.jhta.groupware.emplist.vo.NboardListVo;
import com.jhta.groupware.home.vo.MyProfileVo;


@Controller
public class NboardListController {
	@Autowired 
	NboardListService service;
	
	@RequestMapping("/NboardList")
	public ModelAndView NboardList() {
		System.out.println("List controller");
		ModelAndView mv = new ModelAndView(".login.noticList");
		System.out.println("1");
		List<NboardListVo>nboard= service.getList();
		System.out.println(nboard);
		mv.addObject("list",nboard);
		return mv;
	}
	@RequestMapping("/getNboard")
	public @ResponseBody List<NboardListVo> getNboardByJson() {
		List<NboardListVo> list=service.getList1();
		System.out.println(list);
		return list;
	}
	
	@RequestMapping("/noticInsert")
	public ModelAndView noticInsert(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView(".login.noticInsert");
		HttpSession session = req.getSession();
		int EMP_NUM=(Integer)session.getAttribute("emp_num");
		mv.addObject("emp_num",EMP_NUM);
		return mv;
	}
	
	@RequestMapping("/nboardselect")
	public ModelAndView nboardselect(int B_NUM) {
		ModelAndView mv = new ModelAndView(".login.noticView");
		System.out.println(B_NUM+"게시판번호");
		NboardListVo vo1=service.getSelectNboard(B_NUM);
		mv.addObject("vo",vo1);
		return mv;
	}
	
	@RequestMapping("/insertNboard")
	public String insertNboard(String b_writer,String b_title,String b_content,HttpServletRequest req) {
		HashMap<String,Object>map=new HashMap<>();
		
		HttpSession session = req.getSession();
		int EMP_NUM=(Integer)session.getAttribute("emp_num");
		map.put("EMP_NUM", EMP_NUM);
		map.put("B_WRITER", b_writer);
		map.put("B_TITLE", b_title);
		map.put("B_CONTENT", b_content);
		System.out.println(EMP_NUM+b_writer+b_title+b_content);
		int n = service.insertNboard(map);
		if(n>0) {
			System.out.println("성공");
			return "redirect:/NboardList";
		}else {
			System.out.println("실패");
			return  "redirect:/NboardList";
		}
	}
	@RequestMapping("/updateNboard")
	public ModelAndView updateNboard(String b_num,String b_writer,String b_title,String b_content/*,HttpServletRequest req*/) {
		HashMap<String,Object>map=new HashMap<>();
		//HttpSession session = req.getSession();
		//int EMP_NUM=(Integer)session.getAttribute("emp_num");	
		map.put("B_NUM", b_num);
		map.put("B_WRITER", b_writer);
		map.put("B_TITLE", b_title);
		map.put("B_CONTENT", b_content);
		System.out.println(b_num+b_writer+b_title+b_content);
		int n = service.updateNboard(map);
		if(n>0) {
			System.out.println("성공");
			ModelAndView mv =new ModelAndView(".login.noticList");
			return mv;
		}else {
			System.out.println("실패");
			ModelAndView mv =new ModelAndView(".login.noticList");
			return  mv;
		}
	}
	
	@RequestMapping("/deleteNboard")
	public ModelAndView updateNboard(int b_num) {
		HashMap<String,Object>map=new HashMap<>();
		map.put("B_NUM", b_num);
		int n = service.deleteNboard(map);
		if(n>0) {
			System.out.println("성공");
			ModelAndView mv =new ModelAndView(".login.noticList");
			return mv;
		}else {
			System.out.println("실패");
			ModelAndView mv =new ModelAndView(".login.noticList");
			return  mv;
		}
	}

}















