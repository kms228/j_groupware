package com.jhta.groupware.work.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.groupware.work.service.WorkListService;
import com.jhta.groupware.work.vo.Work_TypeVo;

@Controller
public class WorkListController {
	@Autowired WorkListService service;
	@RequestMapping("/workList")
	public ModelAndView work_list() {
		ModelAndView mv = new ModelAndView(".work.work_list");
		List<Work_TypeVo> wlist = service.selectWorkType();
		mv.addObject("wlist", wlist);
		return mv;
	}
}
