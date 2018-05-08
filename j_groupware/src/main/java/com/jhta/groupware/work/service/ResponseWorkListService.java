package com.jhta.groupware.work.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.groupware.work.dao.ResponseWorkListDao;
import com.jhta.groupware.work.vo.RequestListVo;
import com.jhta.groupware.work.vo.Work_TypeVo;

@Service
public class ResponseWorkListService {
@Autowired ResponseWorkListDao dao;
	
	public List<Work_TypeVo> selectWorkType(){
		return dao.selectWorkType();
	}
	public List<RequestListVo> selectResponseList(Map<String, Object>map){
		return dao.selectResponseList(map);
	}
}
