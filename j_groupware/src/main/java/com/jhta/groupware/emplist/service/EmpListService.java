package com.jhta.groupware.emplist.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.groupware.emplist.dao.EmpListDao;
import com.jhta.groupware.emplist.vo.EmpListVo;

@Service
public class EmpListService {
	@Autowired
	private EmpListDao dao;
	
	public List<EmpListVo> getList(){
		System.out.println("EmpList Service");
		List<EmpListVo> emplist=dao.getList();
		return emplist;
	}
	public List<EmpListVo> retireList(){ 
		System.out.println("RetireList Service");
		List<EmpListVo> emplist=dao.retireList();
		return emplist;
	}
	public int updateEmp(HashMap<String,Object>map) {
		System.out.println("Update Service");
		return dao.updateEmp(map);
	}
	public int updateAcc(HashMap<String,Object>map) {
		System.out.println("Update Service");
		return dao.updateAcc(map);
	}
	public int insertRe(HashMap<String,Object>map) {
		System.out.println("insert Service");
		return dao.insertRe(map);
	}
}
