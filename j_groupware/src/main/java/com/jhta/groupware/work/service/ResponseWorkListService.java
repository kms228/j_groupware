package com.jhta.groupware.work.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.groupware.work.dao.ResponseWorkListDao;
import com.jhta.groupware.work.vo.RequestListVo;
import com.jhta.groupware.work.vo.SearchResponseListVo;
import com.jhta.groupware.work.vo.Work_LineVo;
import com.jhta.groupware.work.vo.Work_TypeVo;

@Service
public class ResponseWorkListService {
@Autowired ResponseWorkListDao dao;
	
	public List<Work_TypeVo> selectWorkType(){
		return dao.selectWorkType();
	}
	public List<SearchResponseListVo> selectResponseList(Map<String, Object>map){
		return dao.selectResponseList(map);
	}
	
	public int accept(int wline_num) {
		return dao.accept(wline_num);
	}
	
	public int unaccept(int wline_num) {
		return dao.unaccept(wline_num);
	}
	
	public int finalUnaccept(int wline_num) {
		return dao.finalUnaccept(wline_num);
	}
	
	public List<Work_LineVo> prepFinalAccept(int wline_num){
		return dao.prepFinalAccept(wline_num);
	}
	
	public int finalAccept(int wline_num) {
		return dao.finalAccept(wline_num);
	}
}
