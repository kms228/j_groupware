package com.jhta.groupware.join.controller;

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
	@Autowired private LoginService service1;
	@RequestMapping(value="/join",method=RequestMethod.GET)
	public String join() {
		return ".login.join";
	}
	//post������� �Ҷ� ȸ�� ���Խ��Ѿ���
	@RequestMapping(value="/join",method=RequestMethod.POST)
	public String joinOk(String ACNT_ID,String ACNT_PWD,int EMP_NUM,
			String EMP_NAME,String EMP_PHONE,String EMP_ADDR,
			String EMP_BIRTH,String EMP_EMAIL,String EMP_GENDER, HttpSession session){
		HashMap<String,Object>map= new HashMap<String, Object>();
		map.put("ACNT_ID",ACNT_ID);
		map.put("ACNT_PWD",ACNT_PWD);
		map.put("EMP_NUM",EMP_NUM);
		map.put("EMP_NAME",EMP_NAME);
		map.put("EMP_PHONE",EMP_PHONE);
		map.put("EMP_ADDR",EMP_ADDR);
		map.put("EMP_BIRTH",EMP_BIRTH);
		map.put("EMP_EMAIL",EMP_EMAIL);
		map.put("EMP_GENDER",EMP_GENDER);
		
		int n = service.isMember(map);
		if(n>0) {
			System.out.println("����");
			return "���ԿϷ��� �̵�������";
		}else {
			System.out.println("����");
			return "���Խ����� �̵�������";
		}
	
	}
	@RequestMapping(value="/join/usingid/{id}",produces="application/json;charset=utf-8")
	@ResponseBody
	public String usingcheck(@PathVariable("id")String id) {
		HashMap<String, Object>map=new HashMap<String, Object>();
		System.out.println("���̽��Ѿ����??");
		map.put("ACNT_ID",id);
		boolean n=service1.login(map);
		JSONObject ob = new JSONObject();
		if(n) {
			ob.put("id","true");
		}else {
			ob.put("id","false");
		}
		System.out.println(ob.toString());
		return ob.toString();	
	}
}







