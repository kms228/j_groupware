package com.jhta.groupware.work.controller;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.groupware.work.service.AnnualService;
import com.jhta.groupware.work.service.RequestWorkService;
import com.jhta.groupware.work.service.SetWorkService;
import com.jhta.groupware.work.vo.AnnualVo;
import com.jhta.groupware.work.vo.WorkListVo;
import com.jhta.groupware.work.vo.WorkandWorkfileVo;

@Controller
public class RequestWorkController {
	@Autowired private RequestWorkService requestWorkService;
	@Autowired private SetWorkService setWorkService;
	@Autowired private AnnualService annualService;
	
	@RequestMapping(value="/requestWork/cancle",produces="application/json;charset=utf-8")
	@ResponseBody
	public String cancle(@RequestParam Map<String,Object> map) {
		//취소
		int work_num = Integer.parseInt((String)map.get("work_num"));
		int n = requestWorkService.cancleWork(work_num);
		int m = requestWorkService.cancleWorkLine(work_num);
		JSONObject json = new JSONObject();
		if(n!=0 || m!=0) {//성공
			json.put("result", true);
		}else {//실패
			json.put("result", false);
		}
		return json.toString();
	}
	
	@RequestMapping("/requestAnn/{wtype}")
	public String insertAnn(@RequestParam Map<String, Object>map, HttpSession session,MultipartFile file,@PathVariable("wtype") String wtype) {
		String emp_num = (String)map.get("emp_num");
		int wtype_num = Integer.parseInt(wtype);
		map.put("wtype_num", wtype_num);
		//결재받을 직원 배열
		System.out.println("emp_num2 : "+map.get("emp_num2"));
		System.out.println("requestAnn.insertAnn.map : "+map);
		String emp_num2_before = (String)map.get("emp_num2");
		String[] emp_num2 = emp_num2_before.split(",");
		System.out.println("배열의 길이 : "+emp_num2.length);
		for(String var:emp_num2) {
			System.out.println("배열들.. : "+var);
		}
		 
		//파일
		String uploadPath = session.getServletContext().getRealPath("/resources/file/workfile");
		String orgFileName = file.getOriginalFilename();
		String saveFileName = UUID.randomUUID()+"_"+orgFileName;
		map.put("wfile_savefilename", saveFileName);
		map.put("wfile_orgfilename", orgFileName);
		
		long fileSize = file.getSize();
		map.put("wfile_size", fileSize);
		System.out.println("파일사이즈 : "+fileSize);
		
		try {
			//파일올리기
			InputStream is = file.getInputStream();
			FileOutputStream fos = new FileOutputStream(uploadPath+"\\"+saveFileName);
			FileCopyUtils.copy(is, fos);
			
			//DB업로드 연차신청(기본적인 신청정보)
			if(wtype_num==1||wtype_num==5||wtype_num==6) {
				//연차/출장/경조사
				requestWorkService.insertAnn(map);
			}else if(wtype_num==2||wtype_num==3||wtype_num==4) {
				//반차/지각/야근
				requestWorkService.insertHalf(map);
			}
			//DB업로드 연차신청(신청정보-첨부파일업로드)
			requestWorkService.insertAnnFile(map);
			//DB업로드 연차신청(결재순서)
			int i=1;
			for(String var:emp_num2) {
				map.put("wline_level", i++);
				map.put("emp_num", var);
				requestWorkService.insertAnnSign(map);
			}
			
			return "redirect:/requestWork/"+emp_num;
		}catch(Exception e) {
			System.out.println(e.getMessage());
			return ".main";
		}
	}
	

	//퇴근버튼(출퇴근 테이블 업데이트)
	@RequestMapping("/workEnd")
	public String work_end(@RequestParam Map<String, Object>map) {
		try {
			//오늘날짜 구하기
			Date today = new Date();
			SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd");
			String wlist_start = date.format(today);
			//오늘날짜 집어넣기
			map.put("wlist_start",wlist_start );
			//해당사원번호의 오늘날짜에 대한 PK받아오기
			WorkListVo vo =  requestWorkService.selectRequestWorkNum(map);
			int wlist_num = vo.getWlist_num();
			//출퇴근 테이블 퇴근시간 업데이트
			map.put("wlist_num", wlist_num);
			requestWorkService.insertRequestWorkEnd(map);
			return "redirect:/requestWork/"+map.get("emp_num");
		}catch(Exception e) {
			System.out.println(e.getMessage());
			return ".main";
		}
	}
	//출근버튼
	@RequestMapping("/workStart")
	public String work_start(@RequestParam Map<String,Object> map) {
//		System.out.println("--------------------RequestWorkController map---------------------");
//		System.out.println("wlist_start : "+map.get("wlist_start"));
//		System.out.println("wlist_type : "+map.get("wlist_type"));
//		System.out.println("emp_num : "+map.get("emp_num"));
//		System.out.println("--------------------RequestWorkController map---------------------");
		try {
			Date wtime_start =  setWorkService.selectWorkTime().getWtime_start();
			SimpleDateFormat format = new SimpleDateFormat("HHmm");
			//공지된 출근시간 int로 형변환(예 22:30 -> 2230)
			int wtime_start2 = Integer.parseInt(format.format(wtime_start));
			System.out.println("wtime_start2 : "+wtime_start2);
			
			//직원 출근시간(string형)을 date타입으로 형변환
			SimpleDateFormat format2 = new SimpleDateFormat("yyyy/MM/dd HH:mm");
			Date d1 = format2.parse((String)map.get("wlist_start"));
			System.out.println(d1);
			//직원 출근시간 date타입을 int타입으로 형변환
			int wlist_start = Integer.parseInt(format.format(d1));
			System.out.println("wlist_start : "+wlist_start);
			//지각(if.공지출근시간<실제출근시간)
			if(wtime_start2<wlist_start) {
				map.put("wlist_type","3");
				//무단지각
				
			}
			requestWorkService.insertRequestWorkStart(map);
			return "redirect:/requestWork/"+map.get("emp_num");
		}catch(Exception e) {
			System.out.println("출근시작 버튼 Exception:"+e.getMessage());
			return ".main";
		}
		
	}
	@RequestMapping("/requestWork/{emp_num}")
	public ModelAndView work_request(@PathVariable String emp_num) {
		ModelAndView mv = new ModelAndView(".work.work_request");
		//오늘날짜 구하기
		Date today = new Date();
		SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd");
		String wlist_start = date.format(today);
		//사원번호와 오늘날짜 집어넣기
		Map<String, Object> map = new HashMap<>();
		map.put("emp_num", emp_num);
		map.put("wlist_start",wlist_start );
		
		//해당사원번호의 오늘날짜에 대한 PK받아오기
		WorkListVo vo =  requestWorkService.selectRequestWorkNum(map);
		System.out.println("해당사원번호의 오늘날짜에 대한 PK받기");
		
		//해당 사원의 연차정보 가져오기
		
		Map<String, Object> amap = new HashMap<>();
		amap.put("emp_num", Integer.parseInt(emp_num));
		SimpleDateFormat ann = new SimpleDateFormat("yyyy");
		String ann_ann = ann.format(today);
		System.out.println("김민수"+ann_ann);
		amap.put("ann_ann", Integer.parseInt(ann_ann));
		AnnualVo annVo = annualService.selectAnn(amap);
		
		//해당 사원의 연차(근태) 신청리스트 가져오기
		List<WorkandWorkfileVo> wwlist = requestWorkService.selectMyRequest(Integer.parseInt(emp_num));
		System.out.println("해당 사원의 연차 신청리스트 가져오기");
		if(vo!=null) {
			int wlist_num = vo.getWlist_num();
			//받아온 PK로 출퇴근시간 받아오기
			WorkListVo vo1 = requestWorkService.selectRequestWork(wlist_num);
			mv.addObject("work", vo1);
			mv.addObject("annual", annVo);
			mv.addObject("wwlist", wwlist);
			return mv;
		}else {
			return mv;
		}
	}
}









