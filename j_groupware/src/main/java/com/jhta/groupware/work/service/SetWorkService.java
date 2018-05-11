package com.jhta.groupware.work.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.groupware.dept.vo.DeptVo;
import com.jhta.groupware.work.dao.SetWorkDao;
import com.jhta.groupware.work.vo.AnnInfoVo;
import com.jhta.groupware.work.vo.HalfTimeVo;
import com.jhta.groupware.work.vo.SearchAdminVo;
import com.jhta.groupware.work.vo.SearchAnnVo;
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
	
	public List<SearchAnnVo> selectAnnInfo(Map<String, Object> map){
		return setWorkDao.selectAnnIfo(map);
	}
	
	public List<DeptVo> getDept(){
		return setWorkDao.getDept();
	}
	
	public List<SearchAnnVo> searchAnn(Map<String, Object>map){
		return setWorkDao.searchAnn(map);
	}
	public int updateAnn(Map<String, Object>map) {
		return setWorkDao.updateAnn(map);
	}
	public List<SearchAdminVo> searchAdmin(){
		return setWorkDao.searchAdmin();
	}
	public int updateAdmin(Map<String, Object>map) {
		return setWorkDao.updateAdmin(map);
	}
	public int cancleAdmin(Map<String, Object>map) {
		return setWorkDao.cancleAdmin(map);
	}
	public SearchAdminVo beforeAdmin(Map<String, Object>map) {
		return setWorkDao.beforeAdmin(map);
	}
}
