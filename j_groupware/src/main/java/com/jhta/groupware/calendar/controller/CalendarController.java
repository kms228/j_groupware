package com.jhta.groupware.calendar.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
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
	public String insert(ScheduleVo vo,MultipartFile file1, HttpSession session) {		
//		System.out.println(vo.getSch_sdate());
//		System.out.println(vo.getSch_edate());
		int result = service.insert(vo,file1,session);
		System.out.println("결과:"+result);
		
		return "redirect:/calendar";
	}
	@RequestMapping(value="/updateSchedule",method=RequestMethod.POST)
	public String update(ScheduleVo vo,MultipartFile file1, HttpSession session) {		
		int result = service.update(vo,file1,session);
		System.out.println("결과:"+result);
		
		return "redirect:/calendar";
	}
	@RequestMapping("/calendar")
	public String calendar() {			
		return ".calendar.calendar";
	}
	@RequestMapping("/getSchedules")
	public @ResponseBody List<Sc_FileVo> getSchedulesByJson(HttpSession session) {
		System.out.println("session Id : "+(String)session.getAttribute("ACNT_ID"));
		List<Sc_FileVo> list = service.getSchedules((String)session.getAttribute("ACNT_ID"));
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
	@RequestMapping(value="/deleteSchedule",produces="application/json;charset=utf-8")
	public @ResponseBody String deleteSchedule(@RequestBody Sc_FileVo vo,HttpSession session) {
		System.out.println("RequestBody: "+vo.getSch_num());
		int result = service.deleteSchedule(vo,session);
		System.out.println("result 반환값 : "+result);
		JSONObject json = new JSONObject();
		if(result>0) {
			json.put("result", "삭제 성공");
		} else {
			json.put("result", "삭제 실패");
		}
		System.out.println("jsonObject 반환값 : "+json.toString());
		return json.toString();
	}
	@RequestMapping(value="/accessAuth",produces="application/json;charset=utf-8")
	public @ResponseBody String accessAuth(int sch_num,HttpSession session) {
		boolean result = service.accessAuth(sch_num,(String)session.getAttribute("ACNT_ID"));
		JSONObject json = new JSONObject();
		json.put("result", result);
		
		System.out.println("jsonObject 반환값 : "+json.toString());
		return json.toString();
	}
	@RequestMapping(value="/file")
	public String download(Model model, int sch_num, HttpSession session) {
		model = service.downloadFile(model,session,sch_num);	
		return "filedownloadView";
	}
}