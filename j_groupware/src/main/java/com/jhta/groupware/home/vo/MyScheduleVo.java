package com.jhta.groupware.home.vo;

import java.util.Date;

public class MyScheduleVo {
	private String sch_title;
	private Date sch_sdate;
	private Date sch_edate;
	
	public MyScheduleVo() {}
	public MyScheduleVo(String sch_title, Date sch_sdate, Date sch_edate) {
		this.sch_title = sch_title;
		this.sch_sdate = sch_sdate;
		this.sch_edate = sch_edate;
	}
	public String getSch_title() {
		return sch_title;
	}
	public void setSch_title(String sch_title) {
		this.sch_title = sch_title;
	}
	public Date getSch_sdate() {
		return sch_sdate;
	}
	public void setSch_sdate(Date sch_sdate) {
		this.sch_sdate = sch_sdate;
	}
	public Date getSch_edate() {
		return sch_edate;
	}
	public void setSch_edate(Date sch_edate) {
		this.sch_edate = sch_edate;
	}
	
}
