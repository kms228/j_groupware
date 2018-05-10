package com.jhta.groupware.work.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.groupware.work.dao.RequestWorkDao;
import com.jhta.groupware.work.vo.WorkListVo;
import com.jhta.groupware.work.vo.WorkandWorkfileVo;

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
	
	public int insertAnn(Map<String, Object>map) {
		return requestWorkDao.insertAnn(map);
	}
	
	public int insertAnnFile(Map<String, Object>map) {
		return requestWorkDao.insertAnnFile(map);
	}
	
	public int insertAnnSign(Map<String, Object>map) {
		return requestWorkDao.insertAnnSign(map);
	}
	
	public List<WorkandWorkfileVo> selectMyRequest(int emp_num){
		return requestWorkDao.selectMyRequest(emp_num);
	}
	
	public int insertHalf(Map<String, Object>map) {
		return requestWorkDao.insertHalf(map);
	}
	
	public int cancleWork(int work_num) {
		return requestWorkDao.cancleWork(work_num);
	}
	
	public int cancleWorkLine(int work_num) {
		return requestWorkDao.cancleWorkLine(work_num);
	}
	
}
