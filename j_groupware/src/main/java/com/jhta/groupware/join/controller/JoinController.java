package com.jhta.groupware.join.controller;

import java.sql.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.groupware.join.service.JoinService;
import com.jhta.groupware.login.service.LoginService;
import com.jhta.groupware.member.vo.MemberAccountVo;

@Controller
public class JoinController {
	//get������� �̵�
	@Autowired private JoinService service;
	@RequestMapping(value="/join",method=RequestMethod.GET)
	public String join() {
		return ".login.join";
	}
	//post������� �Ҷ� ȸ�� ���Խ��Ѿ���
	@RequestMapping(value="/join",method=RequestMethod.POST)
	public String joinOk(String ACNT_ID,String ACNT_PWD,
			String EMP_NAME,String EMP_PHONE,String EMP_ADDR,
			Date EMP_BIRTH,String EMP_EMAIL,String EMP_GENDER, HttpSession session){
		HashMap<String,Object>map= new HashMap<String, Object>();
		map.put("ACNT_ID",ACNT_ID);
		map.put("ACNT_PWD",ACNT_PWD);
		map.put("EMP_NAME",EMP_NAME);
		map.put("EMP_PHONE",EMP_PHONE);
		map.put("EMP_ADDR",EMP_ADDR);
		map.put("EMP_BIRTH",EMP_BIRTH);
		map.put("EMP_EMAIL",EMP_EMAIL);
		map.put("EMP_GENDER",EMP_GENDER);
		System.out.println("controller");
		System.out.println(ACNT_ID+ACNT_PWD+EMP_NAME+EMP_PHONE+EMP_ADDR+EMP_BIRTH+EMP_EMAIL+EMP_GENDER);
		try {		
		service.isMember(map);
			System.out.println("����");
			return ".login.login";
		}catch (Exception e) {
			e.printStackTrace();
			return ".login.login";
		}
	}
	@RequestMapping(value="/join/usingid/{id}",produces="application/json;charset=utf-8")
	@ResponseBody
	public String usingcheck(@PathVariable("id")String id) {
		
		System.out.println("���̽��Ѿ����??");
		String ACNT_ID= id;
		MemberAccountVo vo=service.searchid(ACNT_ID);
		JSONObject ob = new JSONObject();
		System.out.println(vo);
		if(vo!=null) {
			ob.put("id","true");
		}else {
			ob.put("id","false");
		}
		System.out.println(ob.toString());
		return ob.toString();
	}
}









