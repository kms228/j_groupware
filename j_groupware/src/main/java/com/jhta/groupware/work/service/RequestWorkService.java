package com.jhta.groupware.work.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.groupware.work.dao.RequestWorkDao;
import com.jhta.groupware.work.vo.WorkListVo;

@Service
public class RequestWorkService {
	@Autowired private RequestWorkDao requestWorkDao;
	
	public int insertRequestWorkStart(Map<String,Object> map) {
		return requestWorkDao.insertRequestWorkStart(map);
	}
	
	public int insertRequestWorkEnd(Map<String, Object>map) {
		return requestWorkDao.insertRequestWorkEnd(map);
	}
	
	public WorkListVo selectRequestWorkNum(Map<String, Object>map) {
		return requestWorkDao.selectRequestWorkNum(map);
	}
	
	public WorkListVo selectRequestWork(int wlist_num) {
		return requestWorkDao.selectRequestWork(wlist_num);
	}
	
	
	
	
}
