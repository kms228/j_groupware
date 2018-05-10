package com.jhta.groupware.work.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.groupware.work.service.SetWorkService;
import com.jhta.groupware.work.vo.AnnInfoVo;
import com.jhta.groupware.work.vo.HalfTimeVo;
import com.jhta.groupware.work.vo.WorkTimeVo;
@Controller
public class SetWorkController {
	@Autowired private SetWorkService setWorkService;
//	@InitBinder
//	public void InitBinder(WebDataBinder binder) {
//		CustomDateEditor dateEditor = new CustomDateEditor(new SimpleDateFormat("HH:mm"), true);
//		binder.registerCustomEditor(Date.class, dateEditor);
//		System.out.println("InitBinder ¿¡¼­ dateEditor.toString() : "+dateEditor.toString());
//	}
	@RequestMapping(value="/annInfo",produces="application/json;charset=utf-8")
	@ResponseBody
	public String annInfo() {
		
		
		return "";
		
	}
	
	@RequestMapping("/setWork")
	public ModelAndView work_set() {
		ModelAndView mv = new ModelAndView(".work.work_set");
		WorkTimeVo wVo = setWorkService.selectWorkTime();
		HalfTimeVo hVo = setWorkService.selectHalfTime();
		System.out.println("getWorkTimeStart"+wVo.getWtime_start());
		System.out.println("getHalfTimeStart"+hVo.getHtime_start());
		mv.addObject("wVo",wVo);
		mv.addObject("hVo",hVo);
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy");
		Date today = new Date();
		String ann_ann = format.format(today);
		Map<String, Object> map = new HashMap<>();
		map.put("ann_ann", ann_ann);
		List<AnnInfoVo> annVo = setWorkService.selectAnnInfo(map);
		mv.addObject("annVo", annVo);
		return mv;
	}
	
	@RequestMapping("/updateWorkTime")
	public String update(@RequestParam Map<String,String> map){
		System.out.println("wtime_start : "+map.get("wtime_start"));
		try {
			int n = setWorkService.updateWorkTime(map);
			int m = setWorkService.updateHalfTime(map);
			System.out.println(n+","+m);
			return "redirect:/setWork";
		}catch(Exception e){
			System.out.println(e.getMessage());
			return ".main";
		}
	}
	
	
	
}
