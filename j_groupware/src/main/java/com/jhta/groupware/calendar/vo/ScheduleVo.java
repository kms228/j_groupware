package com.jhta.groupware.calendar.vo;

import java.util.Date;

public class ScheduleVo {
	private int sch_num;
	private String sch_title;
	private String sch_content;
	private Date sch_sdate;
	private Date sch_edate;
	private String sch_place;
	private int sch_public;
	private int emp_num;
	private String pst_name;
	private String emp_name;
	
	public ScheduleVo(int sch_num, String sch_title, String sch_content, Date sch_sdate, Date sch_edate,
			String sch_place, int sch_public, int emp_num) {
		this.sch_num = sch_num;
		this.sch_title = sch_title;
		this.sch_content = sch_content;
		this.sch_sdate = sch_sdate;
		this.sch_edate = sch_edate;
		this.sch_place = sch_place;
		this.sch_public = sch_public;
		this.emp_num = emp_num;
	}
	public ScheduleVo() {}
	public int getSch_num() {
		return sch_num;
	}
	public void setSch_num(int sch_num) {
		this.sch_num = sch_num;
	}
	public String getSch_title() {
		return sch_title;
	}
	public void setSch_title(String sch_title) {
		this.sch_title = sch_title;
	}
	public String getSch_content() {
		return sch_content;
	}
	public void setSch_content(String sch_content) {
		this.sch_content = sch_content;
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
	public String getSch_place() {
		return sch_place;
	}
	public void setSch_place(String sch_place) {
		this.sch_place = sch_place;
	}
	public int getSch_public() {
		return sch_public;
	}
	public void setSch_public(int sch_public) {
		this.sch_public = sch_public;
	}
	public int getEmp_num() {
		return emp_num;
	}
	public void setEmp_num(int emp_num) {
		this.emp_num = emp_num;
	}
	public String getPst_name() {
		return pst_name;
	}
	public void setPst_name(String pst_name) {
		this.pst_name = pst_name;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}	
}
