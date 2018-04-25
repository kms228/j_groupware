package com.jhta.groupware.work.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.groupware.work.service.RequestWorkService;
import com.jhta.groupware.work.service.SetWorkService;
import com.jhta.groupware.work.vo.WorkListVo;

@Controller
public class RequestWorkController {
	@Autowired private RequestWorkService requestWorkService;
	@Autowired private SetWorkService setWorkService;
	
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
		int wlist_num = vo.getWlist_num();
		//받아온 PK로 출퇴근시간 받아오기
		WorkListVo vo1 = requestWorkService.selectRequestWork(wlist_num);
		mv.addObject("work", vo1);
		return mv;
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
		System.out.println("--------------------RequestWorkController map---------------------");
		System.out.println("wlist_start : "+map.get("wlist_start"));
		System.out.println("wlist_type : "+map.get("wlist_type"));
		System.out.println("emp_num : "+map.get("emp_num"));
		System.out.println("--------------------RequestWorkController map---------------------");
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
				map.put("wlist_type","4");
			}
			requestWorkService.insertRequestWorkStart(map);
			return "redirect:/requestWork/"+map.get("emp_num");
		}catch(Exception e) {
			System.out.println("출근시작 버튼 Exception:"+e.getMessage());
			return ".main";
		}
		
	}
}









