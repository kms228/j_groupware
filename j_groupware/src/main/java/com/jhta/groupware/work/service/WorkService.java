package com.jhta.groupware.work.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.groupware.work.dao.WorkDao;
import com.jhta.groupware.work.vo.ScheduleVo;

@Service
public class WorkService {
	@Autowired WorkDao dao;
	
	public List<ScheduleVo> searchSch(Map<String, Object>map){
		List<ScheduleVo> a = dao.searchSch(map);
		for (ScheduleVo vo : a) {
			System.out.println(vo.toString());
		}
		
		return a;
		//return dao.searchSch(map);
	}
}
