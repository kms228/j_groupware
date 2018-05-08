package com.jhta.groupware.work.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.groupware.work.dao.RequestWorkListDao;
import com.jhta.groupware.work.dao.WorkListDao;
import com.jhta.groupware.work.vo.Work_TypeVo;

@Service
public class WorkListService {
@Autowired WorkListDao dao;
	
	public List<Work_TypeVo> selectWorkType(){
		return dao.selectWorkType();
	}
}
