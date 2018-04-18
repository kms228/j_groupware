package com.jhta.groupware.calendar.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jhta.groupware.calendar.service.CalendarService;
import com.jhta.groupware.calendar.vo.PositionVo;
import com.jhta.groupware.calendar.vo.Sc_FileVo;
import com.jhta.groupware.calendar.vo.ScheduleVo;

@Controller
public class CalendarController {
	@Autowired private CalendarService service;
	
	@RequestMapping(value="/schedule",method=RequestMethod.POST)
	public String schedule(ScheduleVo vo,MultipartFile file1, HttpSession session) {		
//		System.out.println(vo.getSch_sdate());
//		System.out.println(vo.getSch_edate());
		int result = service.insert(vo,file1,session);
		System.out.println("°á°ú:"+result);
		
		return "redirect:/calendar";
	}
	@RequestMapping("/calendar")
	public String calendar() {			
		return ".calendar";
	}
	@RequestMapping("/getSchedules")
	public @ResponseBody List<Sc_FileVo> getSchedulesByJson() {
		List<Sc_FileVo> list = service.getSchedules("hong");		
		return list;
	}
	@RequestMapping("/getSchedule")
	public @ResponseBody Sc_FileVo getScheduleByJson(int sch_num) {
		System.out.println("sch_num:"+sch_num);
		Sc_FileVo vo = service.getSchedule(sch_num);
		System.out.println(vo.getSch_title());
		return vo;
	}
	@RequestMapping("/getPosition")
	public @ResponseBody List<PositionVo> getPositionByJson() {
		List<PositionVo> list = service.getPosition();		
		return list;
	}
}