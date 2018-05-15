package com.jhta.groupware.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.groupware.home.service.HomeService;
import com.jhta.groupware.home.vo.MyProfileVo;
import com.jhta.groupware.home.vo.MyScheduleVo;
import com.jhta.groupware.home.vo.MyWorkListVo;
@Controller
public class HomeController {
	@Autowired private HomeService service;
	
	@RequestMapping("/")
	public String home() {
		return ".main";
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