package com.jhta.groupware.home.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.groupware.home.dao.HomeDao;
import com.jhta.groupware.home.vo.MyProfileVo;
import com.jhta.groupware.home.vo.MyScheduleVo;
import com.jhta.groupware.home.vo.MyWorkListVo;

@Service
public class HomeService {
	@Autowired private HomeDao dao;
	
	public MyProfileVo getMyProfile(HttpSession session) {
		String acnt_id=(String)session.getAttribute("ACNT_ID");
		return dao.getMyProfile(acnt_id);
	}

	public List<MyScheduleVo> getMySchedule(HttpSession session) {
		String acnt_id=(String)session.getAttribute("ACNT_ID");
		return dao.getMySchedule(acnt_id);
	}

	public List<MyWorkListVo> getMyWorkList(HttpSession session) {
		String acnt_id=(String)session.getAttribute("ACNT_ID");
		return dao.getMyWorkList(acnt_id);
	}

}
