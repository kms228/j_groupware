package com.jhta.groupware.work.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.groupware.dept.vo.DeptVo;
import com.jhta.groupware.work.service.SetWorkService;
import com.jhta.groupware.work.vo.HalfTimeVo;
import com.jhta.groupware.work.vo.SearchAdminVo;
import com.jhta.groupware.work.vo.SearchAnnVo;
import com.jhta.groupware.work.vo.WorkTimeVo;
@Controller
public class SetWorkController {
	@Autowired private SetWorkService setWorkService;
//	@InitBinder
//	public void InitBinder(WebDataBinder binder) {
//		CustomDateEditor dateEditor = new CustomDateEditor(new SimpleDateFormat("HH:mm"), true);
//		binder.registerCustomEditor(Date.class, dateEditor);
//		System.out.println("InitBinder ���� dateEditor.toString() : "+dateEditor.toString());
//	}
	@RequestMapping(value="/delAdmin",produces="application/json;charset=utf-8")
	@ResponseBody
	public List<SearchAdminVo> delAdmin(@RequestParam Map<String,Object> map) {
		System.out.println("--------------------map.toString : "+map.toString());
		int n = setWorkService.delAdmin(map);
		List<SearchAdminVo> salist = new ArrayList<>();
		if(n>0) {
			salist = setWorkService.searchAdmin();
		}
		return salist;
	}
	
	
	@RequestMapping(value="/updateAdmin2",produces="application/json;charset=utf-8")
	@ResponseBody
	public SearchAdminVo selectRequestList(@RequestParam Map<String,Object> map) {
		System.out.println("--------------------map.toString : "+map.toString());
		int n = setWorkService.updateAdmin(map);
		SearchAdminVo saVo = new SearchAdminVo();
		if(n>0) {
			saVo = setWorkService.beforeAdmin(map);
		}
		return saVo;
	}
	
	//������ ����
	@RequestMapping(value="/updateAdmin",produces="application/json;charset=utf-8")
	@ResponseBody
	public String beforeAdmin(@RequestParam Map<String, Object>map) {
		
		int n = setWorkService.updateAdmin(map);
		JSONObject json = new JSONObject();
		if(n!=0) {//������Ʈ����
			json.put("result", true);
		}else {//����
			json.put("result", false);
		}
		return json.toString();
		
	}
	
	//�������� update
	@RequestMapping(value="/updateAnn",produces="application/json;charset=utf-8")
	@ResponseBody
	public String updateAnn(@RequestParam Map<String, Object>map) {
		int n = setWorkService.updateAnn(map);
		JSONObject json = new JSONObject();
		if(n!=0) {//������Ʈ����
			json.put("result", true);
		}else {//����
			json.put("result", false);
		}
		return json.toString();
		
	}
	
	//�������� ajax
	@RequestMapping(value="/searchAnn",produces="application/json;charset=utf-8")
	@ResponseBody
	public List<SearchAnnVo> annInfo(@RequestParam Map<String, Object>map) {
		
		List<SearchAnnVo> searchAnnVo = setWorkService.searchAnn(map);
		return searchAnnVo;
		
	}
	//setWork ������
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
		
		//��ü ����������������
		Map<String, Object> map = new HashMap<>();
		map.put("ann_ann", ann_ann);
		List<SearchAnnVo> annVo = setWorkService.selectAnnInfo(map);
		mv.addObject("annVo", annVo);
		
		//�μ����� ��������
		List<DeptVo> deptVo = setWorkService.getDept();
		mv.addObject("deptVo",deptVo);
		
		//������ ������������
		List<SearchAdminVo> adminVo = setWorkService.searchAdmin();
		mv.addObject("adminVo",adminVo);
		return mv;
	}
	
	//����ٽð� �����ð� ��������
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
