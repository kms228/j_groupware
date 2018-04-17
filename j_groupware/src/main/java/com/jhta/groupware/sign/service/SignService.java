package com.jhta.groupware.sign.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.groupware.sign.dao.SignDao;
import com.jhta.groupware.sign.vo.DocTypeVo;
import com.jhta.groupware.sign.vo.SignLineListVo;
import com.jhta.groupware.sign.vo.SignVo;

@Service
public class SignService {
	@Autowired private SignDao dao;
	
	public DocTypeVo getdoc(int num) {
		return dao.getdoc(num);
	}
	
	public List<SignVo> nowlist(){
		return dao.nowlist();
	}
	
	public List<SignLineListVo> signlinelist(){
		return dao.signlinelist();
	}
	
	public List<SignLineListVo> deptlist(){
		return dao.deptlist();
	}
}
