package com.jhta.groupware.emplist.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.groupware.emplist.service.NboardListService;
import com.jhta.groupware.emplist.vo.NboardListVo;


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
	
	@RequestMapping("/nboardselect")
	public ModelAndView nboardselect(int B_NUM) {
		ModelAndView mv = new ModelAndView(".login.noticView");
		System.out.println(B_NUM+"게시판번호");
		NboardListVo vo1=service.getSelectNboard(B_NUM);
		mv.addObject("vo",vo1);
		return mv;
	}
	
	@RequestMapping("/insertNboard")
	public ModelAndView insertNboard(int EMP_NUM,String B_WRITER,String B_TITLE,String B_CONTENT) {
		HashMap<String,Object>map=new HashMap<>();
		map.put("EMP_NUM", EMP_NUM);
		map.put("B_WRITER", B_WRITER);
		map.put("B_TITLE", B_TITLE);
		map.put("B_CONTENT", B_CONTENT);
		int n = service.insertNboard(map);
		if(n>0) {
			System.out.println("성공");
			ModelAndView mv =new ModelAndView(".login.noticList");
			mv.addObject("EMP_NUM",EMP_NUM);
			return mv;
		}else {
			System.out.println("실패");
			ModelAndView mv =new ModelAndView(".login.NboardSelectView");
			return  mv;
		}
	}

}















