package com.jhta.groupware.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.groupware.home.service.HomeService;
import com.jhta.groupware.home.vo.MyProfileVo;
import com.jhta.groupware.home.vo.MyScheduleVo;
import com.jhta.groupware.home.vo.MyWorkListVo;
import com.jhta.groupware.work.service.WorkService;
import com.jhta.groupware.work.vo.SearchTodayVo;
@Controller
public class HomeController {
	@Autowired private HomeService service;
	@Autowired WorkService service2;
	
	@RequestMapping("/")
	public ModelAndView work(HttpSession session) {
		Object emp_num = session.getAttribute("emp_num");
		ModelAndView mv = new ModelAndView(".main");
		Map<String, Object>map = new HashMap<>();
		map.put("emp_num", emp_num);
		List<SearchTodayVo> st1 = service2.searchToday1(map);
		List<SearchTodayVo> st2 = service2.searchToday2(map);
		System.out.println("11111111111111111111111111111111111111"+st1.toString());
		mv.addObject("st1", st1);
		mv.addObject("st2", st2);
		return mv;
	}
	
	@RequestMapping("/getMyProfile")
	public @ResponseBody MyProfileVo getMyProfileByJson(HttpSession session) {
		MyProfileVo vo = service.getMyProfile(session);
		return vo;
	}
	@RequestMapping("/getMySchedule")
	public @ResponseBody List<MyScheduleVo> getMyScheduleByJson(HttpSession session) {
		List<MyScheduleVo> list = service.getMySchedule(session);
		return list;
	}
	@RequestMapping("/getMyWorkList")
	public @ResponseBody List<MyWorkListVo> getMyWorkListByJson(HttpSession session) {
		List<MyWorkListVo> list = service.getMyWorkList(session);
		return list;
	}
}