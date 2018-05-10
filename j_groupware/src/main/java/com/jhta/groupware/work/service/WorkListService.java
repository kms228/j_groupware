package com.jhta.groupware.work.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.groupware.work.dao.WorkListDao;
import com.jhta.groupware.work.vo.RequestListVo;
import com.jhta.groupware.work.vo.Work_TypeVo;

@Service
public class WorkListService {
@Autowired WorkListDao dao;
	
	public List<Work_TypeVo> selectWorkType(){
		return dao.selectWorkType();
	}
	public List<RequestListVo> searchRequestList(Map<String, Object>map){
		return dao.searchRequestList(map);
	}
}
