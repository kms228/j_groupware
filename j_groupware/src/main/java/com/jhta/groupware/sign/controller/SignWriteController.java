package com.jhta.groupware.sign.controller;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.groupware.sign.service.SignService;
import com.jhta.groupware.sign.vo.DocTypeVo;
import com.jhta.groupware.sign.vo.SignLineListVo;

@Controller
public class SignWriteController {
	@Autowired private SignService service;
	@RequestMapping("/signwrite")
	public ModelAndView signwrite(int num) {
		System.out.println(num);
		DocTypeVo vo=service.getdoc(num);
		System.out.println(vo);
		ModelAndView mv=new ModelAndView(".sign.sign_write");
		mv.addObject("vo",vo);
		return mv;
	}
	
	@RequestMapping("/addsign")
	public String addsign(String ir1) {
		System.out.println(ir1);
		return ".sign.sign_main";
	}
	
	@RequestMapping(value="/signlinelist",produces="application/json;charset=utf-8")
	@ResponseBody
	public String linelist() {
		List<SignLineListVo> list= service.signlinelist();
		List<SignLineListVo> deptlist=service.deptlist();
		JSONArray arr=new JSONArray();
		for(SignLineListVo vo:deptlist) {
			JSONObject ob=new JSONObject();
			ob.put("id",vo.getDept_num());
			ob.put("name",vo.getDept_name());
			ob.put("pId",0);
			arr.put(ob);
		}
		for(SignLineListVo vo:list) {
			JSONObject ob=new JSONObject();
			ob.put("id", vo.getDept_name());
			ob.put("name",vo.getEmp_name()+" "+vo.getPst_name());
			/*ob.put("emp_num",vo.getEmp_num());
			ob.put("pst_name",vo.getPst_name());
			ob.put("dept_name",vo.getDept_name());
			ob.put("pst_num",vo.getPst_num());*/
			ob.put("pId",vo.getDept_num());
			arr.put(ob);
		}
		System.out.println(arr.toString());
		return arr.toString();
	}
}
