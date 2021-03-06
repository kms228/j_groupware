package com.jhta.groupware.work.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.groupware.work.service.WorkService;
import com.jhta.groupware.work.vo.ScheduleVo;
import com.jhta.groupware.work.vo.SearchTodayVo;
@Controller
public class WorkController {
	@Autowired WorkService service;
	
	@RequestMapping("/work/{emp_num}")
	public ModelAndView work(@PathVariable String emp_num) {
		ModelAndView mv = new ModelAndView(".work.work");
		Map<String, Object>map = new HashMap<>();
		map.put("emp_num", emp_num);
		List<SearchTodayVo> st1 = service.searchToday1(map);
		List<SearchTodayVo> st2 = service.searchToday2(map);
		System.out.println("11111111111111111111111111111111111111"+st1.toString());
		mv.addObject("st1", st1);
		mv.addObject("st2", st2);
		return mv;
	}
	
	@RequestMapping(value="/searchSch",produces="application/json;charset=utf-8")
	@ResponseBody
	public List<ScheduleVo> searchSch(HttpSession session){
		Map<String, Object> map = new HashMap<>();
		map.put("emp_num", session.getAttribute("emp_num"));
		System.out.println(session.getAttribute("emp_num"));
		List<ScheduleVo> slist = service.searchSch(map);
		System.out.println("22222222222222222222222222222222222222222222222222222");
		for(ScheduleVo vo:slist) {
			System.out.println("emp_name : "+vo.getEmp_name());
			System.out.println("emp_num : "+vo.getEmp_num());
			System.out.println("work_content : "+vo.getWork_content());
			System.out.println("work_edate : "+vo.getWork_edate());
			System.out.println("work_sdate : "+vo.getWork_sdate());
			System.out.println("wtype_num : "+vo.getWork_num());
		}
		return slist;
	}
	
	
	
}
