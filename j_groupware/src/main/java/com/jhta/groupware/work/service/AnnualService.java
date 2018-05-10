package com.jhta.groupware.work.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.groupware.work.dao.AnnualDao;
import com.jhta.groupware.work.vo.AnnualVo;

@Service
public class AnnualService {
	@Autowired private AnnualDao annualDao;
	
	public AnnualVo selectAnn(Map<String, Object> map) {
		return annualDao.selectAnn(map);
	}
}
