package com.jhta.groupware.sign.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.groupware.sign.dao.SignDao;
import com.jhta.groupware.sign.vo.DocTypeVo;
import com.jhta.groupware.sign.vo.SdocLineVo;
import com.jhta.groupware.sign.vo.SignLineDocVo;
import com.jhta.groupware.sign.vo.SignLineListVo;
import com.jhta.groupware.sign.vo.SignNowVo;
import com.jhta.groupware.sign.vo.SignVo;

@Service
public class SignService {
	@Autowired private SignDao dao;
	
	public DocTypeVo getdoc(int num) {
		return dao.getdoc(num);
	}
	
	public List<SignNowVo> nowlist(int emp_num){
		return dao.nowlist(emp_num);
	}
	
	public List<SignLineListVo> signlinelist(){
		return dao.signlinelist();
	}
	
	public List<SignLineListVo> deptlist(){
		return dao.deptlist();
	}
	
	public int addsigndoc(SignVo vo) {
		return dao.addsigndoc(vo);
	}
	
	public int sdocline(SdocLineVo vo) {
		return dao.addsdocline(vo);
	}
	
	public List<SdocLineVo> mysigndoc(int emp_num){
		return dao.mysigndoc(emp_num);
	}
	
	public SignNowVo getsignnow(int sdoc_num) {
		return dao.getsigndoc(sdoc_num);
	}
	
	public SignVo getnowdoc(int sdoc_num) {
		return dao.getnowdoc(sdoc_num);
	}
	
	public List<SdocLineVo> getsignline(int sdoc_num){
		return dao.getsignline(sdoc_num);
	}
	
	public SignLineListVo getempinfo(int emp_num) {
		return dao.getempinfo(emp_num);
	}
	
	public List<SignLineDocVo> linesigndoc(int emp_num){
		return dao.linesigndoc(emp_num);
	}
}
