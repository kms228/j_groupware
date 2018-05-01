package com.jhta.groupware.calendar.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
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
		System.out.println("emp_num : "+getEmp_num((String)session.getAttribute("ACNT_ID")));
		vo.setEmp_num(getEmp_num((String)session.getAttribute("ACNT_ID")));
		int result = dao.insertSchedule(vo);
		if(file1.isEmpty()==false) {
			System.out.println("파일의 이름은?:"+file1.getName());
			ManipulateFile file = new ManipulateFile(file1,session);
			String saveFileName = file.copyFileToServer("/resources/upload/calendar");
//			System.out.println(saveFileName);
			Sc_FileVo vo1 = new Sc_FileVo(0, saveFileName, file1.getOriginalFilename(), file1.getSize(), dao.getSch_num(getEmp_num((String)session.getAttribute("ACNT_ID"))));
			result = dao.insertSc_File(vo1);
		}
		return result;
	}
	public Sc_FileVo getSc_file(int sch_num) {
		return dao.getSc_file(sch_num);
	}
	public int update(ScheduleVo vo, MultipartFile file1, HttpSession session) {		
		int result = 0;
		result = dao.updateSchedule(vo);
		System.out.println("파일이 비어있는지 : "+file1.isEmpty());
		if(file1.isEmpty()==false) {
			System.out.println("getSc_file.toString():"+getSc_file(vo.getSch_num()));
			Sc_FileVo oldFile=getSc_file(vo.getSch_num());
			if(oldFile!=null) {
				System.out.println("수정하려고 하는 튜플에 파일이 있음을 확인");				
				result = deleteFile(session, oldFile);
				result = deleteSc_File(vo.getSch_num());
			}
			
			ManipulateFile file = new ManipulateFile(file1,session);
			String saveFileName = file.copyFileToServer("/resources/upload/calendar");
//			System.out.println(saveFileName);			
			Sc_FileVo vo1 = new Sc_FileVo(0, saveFileName, file1.getOriginalFilename(), file1.getSize(), vo.getSch_num());
			
			result = dao.insertSc_File(vo1);			
		}
		return result;
	}
	
	public List<Sc_FileVo> getSchedules(String id) {
		List<Sc_FileVo> vo = dao.getSchedules(id);
		return vo; 
	}

	public Sc_FileVo getSchedule(int sch_num) {
		return dao.getSchedule(sch_num);
	}
	public List<PositionVo> getPosition() {
		return dao.getPosition();
	}	
	private int deleteFile(HttpSession session, Sc_FileVo vo) {
		int result = 0;
		String fileName = session.getServletContext().getRealPath(vo.getSf_savefilename());
		result = new ManipulateFile().deleteFile(fileName);
		return result;
	}
	private int deleteSc_File(int sch_num) {
		return dao.deleteSc_File(sch_num);
	}
	public int deleteSchedule(Sc_FileVo vo,HttpSession session) {
		String savefile=vo.getSf_savefilename();
		if(!(savefile==null)) {
			deleteFile(session,vo);
			deleteSc_File(vo.getSch_num());
		}
		return dao.deleteSchedule(vo.getSch_num());
	}
	public boolean accessAuth(int sch_num, String id) {		
		HashMap<String, Object> map = new HashMap<>();		
		map.put("sch_num", sch_num);
		map.put("id", id);
		int result = dao.modAuth(map);
		System.out.println("검색 결과 : " + result);
		if(result > 0) {
			return true;
		}		
		return false;
	}
	private int getEmp_num(String id) {
		return dao.getEmp_num(id);
	}
	public Model downloadFile(Model model, HttpSession session, int sch_num) {
		Sc_FileVo vo = getSc_file(sch_num);
		
		String path=session.getServletContext().getRealPath("");			
		File f=new File(path + vo.getSf_savefilename());
		System.out.println("맞나...??:"+f.exists());
		model.addAttribute("file", f);
		model.addAttribute("filename", vo.getSf_orgfilename());
		model.addAttribute("filesize", vo.getSf_size());
		return model;
	}	
}