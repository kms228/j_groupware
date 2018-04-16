package com.jhta.groupware.calendar.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.jhta.groupware.calendar.service.CalendarService;
import com.jhta.groupware.calendar.vo.ScheduleVo;

@Controller
public class CalendarController {
	@Autowired private CalendarService service;
	
	@RequestMapping(value="/schedule",method=RequestMethod.POST)
	public String schedule(ScheduleVo vo,MultipartFile file1, HttpSession session) {
		System.out.println(vo.getSch_sdate());
		System.out.println(vo.getSch_edate());
		System.out.println(vo.getSch_content());		
		System.out.println(vo.getSch_place());
		System.out.println("");
		int result = service.insert(vo,file1,session);
		System.out.println("결과:"+result);
			///////////////////// 2. DB저장 ////////////////////////////////////////////
//			long filesize=file1.getSize();//파일크기 구하기
//			FileinfoVo vo=new FileinfoVo(0, writer, title, content, orgfilename, savefilename, filesize);
//			service.insert(vo);
			////////////////////////////////////////////////////////////////////////////
//			return "file/success";				
//			return "file/error";		
		return "";
	}
}
