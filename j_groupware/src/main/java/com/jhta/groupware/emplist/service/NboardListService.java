package com.jhta.groupware.emplist.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.groupware.emplist.dao.NboardListDao;
import com.jhta.groupware.emplist.vo.NboardListVo;

@Service
public class NboardListService {
	@Autowired
	private NboardListDao dao;
	
	public List<NboardListVo> getList(){
		System.out.println("Nboard List service");
		List<NboardListVo> nlist=dao.getList();
		return nlist;
	}
	
	public NboardListVo getSelectNboard(int B_NUM) {
		NboardListVo vo1 = dao.getSelectNboard(B_NUM);
		return vo1;
	}
	public int insertNboard(HashMap<String, Object> map) {
		System.out.println("insert Service");
		return dao.insertNboard(map);
	}
	public int updateNboard(HashMap<String, Object> map) {
		System.out.println("update Service");
		return dao.updateNboard(map);
	}
	public int deleteNboard(HashMap<String, Object> map) {
		System.out.println("update Service");
		return dao.deleteNboard(map);
	}

	public List<NboardListVo> getList1(){
		NboardListVo nlist=(NboardListVo) dao.getList1();
		return dao.getList1();
	}
}
