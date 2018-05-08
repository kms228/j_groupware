package com.jhta.groupware.work.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.groupware.work.service.RequestWorkListService;
import com.jhta.groupware.work.vo.RequestListVo;
import com.jhta.groupware.work.vo.Work_TypeVo;

@Controller
public class RequestWorkListController {
	@Autowired RequestWorkListService service;
	
	@RequestMapping("/requestWorkList")
	public ModelAndView work_requestList() {
		ModelAndView mv = new ModelAndView(".work.work_requestList");
		List<Work_TypeVo> wlist = service.selectWorkType();
		mv.addObject("wlist", wlist);
		return mv;
	}
	
	@RequestMapping(value="/requestWorkList/search",produces="application/json;charset=utf-8")
	@ResponseBody
	public List<RequestListVo> selectRequestList(@RequestParam Map<String,Object> map) {
		System.out.println("--------------------map.toString : "+map.toString());
		
			String alist[] = ((String)map.get("emp_num2")).split(",");
			map.put("alist", alist);
		
		
		List<RequestListVo> requestList = service.selectRequestList(map);
		return requestList;
	}
}
