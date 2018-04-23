package com.jhta.groupware.work.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	@RequestMapping("/requestWork")
	public ModelAndView work_request(@RequestParam Map<String, Object> map) {
		ModelAndView mv = new ModelAndView(".work.work_request");
		WorkListVo vo = requestWorkService.selectRequestWork(map);
		System.out.println("WorkListVo.toString : "+vo.toString());
		mv.addObject("work");
		return mv;
	}
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
			return "redirect:/requestWork";
		}catch(Exception e) {
			System.out.println("출근시작 버튼 Exception:"+e.getMessage());
			return ".main";
		}
		
	}
}
