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
	
	public WorkListVo selectRequestWork(Map<String, Object>map) {
		return requestWorkDao.selectRequestWork(map);
	}
	
	
}
