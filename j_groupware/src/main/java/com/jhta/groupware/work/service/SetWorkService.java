package com.jhta.groupware.work.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.groupware.work.dao.SetWorkDao;
import com.jhta.groupware.work.vo.HalfTimeVo;
import com.jhta.groupware.work.vo.WorkTimeVo;

@Service
public class SetWorkService {
	@Autowired private SetWorkDao setWorkDao;
	
	public int updateWorkTime(Map<String, String>map) {
		return setWorkDao.updateWorkTime(map);
	}
	public int updateHalfTime(Map<String, String>map) {
		return setWorkDao.updateHalfTime(map);
	}
	
	public WorkTimeVo selectWorkTime(){
		return setWorkDao.selectWorkTime();
	}
	public HalfTimeVo selectHalfTime(){
		return setWorkDao.selectHalfTime();
	}
}
