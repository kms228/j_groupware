package com.jhta.groupware.calendar.service;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.jhta.groupware.calendar.dao.CalendarDao;
import com.jhta.groupware.calendar.vo.PositionVo;
import com.jhta.groupware.calendar.vo.Sc_FileVo;
import com.jhta.groupware.calendar.vo.ScheduleVo;
import com.jhta.groupware.etc.ManipulateFile;

@Service
public class CalendarService {
	@Autowired private CalendarDao dao;	
	
	public int insert(ScheduleVo vo, MultipartFile file1, HttpSession session) {
		int result = dao.insertSchedule(vo);
		if(file1.isEmpty()==false) {
			System.out.println("파일의 이름은?:"+file1.getName());			
			ManipulateFile file = new ManipulateFile(file1,session);		
			String saveFileName = file.copyFileToServer("/resources/upload/calendar");
			System.out.println(saveFileName);
			Sc_FileVo vo1 = new Sc_FileVo(0, saveFileName, file1.getOriginalFilename(), file1.getSize(), dao.getSch_num(vo.getEmp_num()));
			result = dao.sc_File(vo1);				
		}				
		return result;
	}
	public int update(ScheduleVo vo, MultipartFile file1, HttpSession session) {
		return 0;
	}
	
	public List<Sc_FileVo> getSchedules(String id) {
		List<Sc_FileVo> vo = dao.getSchedules(id);
		for(Sc_FileVo vo1:vo) {
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss a");			
			
			
			System.out.println("시작일:"+vo1.getSch_sdate().getTime());
			System.out.println("시작일:"+sdf1.format(vo1.getSch_sdate()));
			System.out.println("종료일:"+vo1.getSch_edate().getTime());
			System.out.println("종료일:"+sdf1.format(vo1.getSch_edate()));
		}
		return vo; 
	}

	public Sc_FileVo getSchedule(int sch_num) {
		return dao.getSchedule(sch_num);
	}

	public List<PositionVo> getPosition() {
		return dao.getPosition();
	}	
}
