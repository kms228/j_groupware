package com.jhta.groupware.work.controller;

import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.groupware.work.service.ResponseWorkListService;
import com.jhta.groupware.work.vo.SearchResponseListVo;
import com.jhta.groupware.work.vo.Work_LineVo;
import com.jhta.groupware.work.vo.Work_TypeVo;

@Controller
public class ResponseWorkListController {
	@Autowired ResponseWorkListService service;
	
	@RequestMapping("/responseWorkList")
	public ModelAndView work_responseList() {
		ModelAndView mv = new ModelAndView(".work.work_responseList");
		//���±���(����,����,����,...)
		List<Work_TypeVo> wlist = service.selectWorkType();
		mv.addObject("wlist", wlist);
		return mv;
	}
	
	@RequestMapping(value="/responseWorkList/search",produces="application/json;charset=utf-8")
	@ResponseBody
	public List<SearchResponseListVo> selectResponseList(@RequestParam Map<String,Object> map) {
		System.out.println("--------------------map.toString : "+map.toString());
		
		List<SearchResponseListVo> requestList = service.selectResponseList(map);
		return requestList;
	}
	
	@RequestMapping(value="/responseWorkList/accept",produces="application/json;charset=utf-8")
	@ResponseBody
	public String accept(@RequestParam Map<String,Object> map) {
		int n = service.accept(Integer.parseInt((String)map.get("wline_num")));
		List<Work_LineVo> wlist =  service.prepFinalAccept(Integer.parseInt((String)map.get("wline_num")));
		System.out.println("wlist.size : "+wlist.size());
		int wSize = wlist.size();
		int wSize2=0;
		for(Work_LineVo vo:wlist) {
			if(vo.getWline_state()==1) {
				wSize2++;
				System.out.println("�߰����� 1���Ϸ�  wSize2: "+wSize2);
			}else {
				System.out.println("�߰����� ��Ϸ�");
			}
		}
		System.out.println("�߰����� ���� : "+wSize2+"/���� ���� �ޱ� ���� ���� : "+wSize);
		//wSize==wSize2�̸� ��������
		if(wSize==wSize2) {
			service.finalAccept(Integer.parseInt((String)map.get("wline_num")));
		}
		JSONObject json = new JSONObject();
		if(n!=0) {//����
			json.put("result", true);
		}else {//����
			json.put("result", false);
		}
		return json.toString();
	}
	
	@RequestMapping(value="/responseWorkList/unaccept",produces="application/json;charset=utf-8")
	@ResponseBody
	public String unaccept(@RequestParam Map<String,Object> map) {
		//�ݷ�
		int m=service.unaccept(Integer.parseInt((String)map.get("wline_num")));
		int n;
		if(m!=0) {
			//�����ݷ�
			n=service.finalUnaccept(Integer.parseInt((String)map.get("wline_num")));
		}else {
			n=0;
		}
		JSONObject json = new JSONObject();
		if(n!=0) {//����
			json.put("result", true);
		}else {//����
			json.put("result", false);
		}
		return json.toString();
	}
	
	
}
