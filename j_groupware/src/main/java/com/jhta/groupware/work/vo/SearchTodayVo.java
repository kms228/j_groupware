package com.jhta.groupware.work.vo;

import java.util.Date;

public class SearchTodayVo {
	private int work_num;
	private String dept_name;
	private String emp_name;
	private String wtype_name;
	private String term;
	private Date work_sdate;
	private Date work_edate;
	private int wtpye_num;
	private String work_content;
	
	public SearchTodayVo() {}

	public SearchTodayVo(int work_num, String dept_name, String emp_name, String wtype_name, String term,
			Date work_sdate, Date work_edate, int wtpye_num, String work_content) {
		super();
		this.work_num = work_num;
		this.dept_name = dept_name;
		this.emp_name = emp_name;
		this.wtype_name = wtype_name;
		this.term = term;
		this.work_sdate = work_sdate;
		this.work_edate = work_edate;
		this.wtpye_num = wtpye_num;
		this.work_content = work_content;
	}

	public int getWork_num() {
		return work_num;
	}

	public void setWork_num(int work_num) {
		this.work_num = work_num;
	}

	public String getDept_name() {
		return dept_name;
	}

	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}

	public String getEmp_name() {
		return emp_name;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}

	public String getWtype_name() {
		return wtype_name;
	}

	public void setWtype_name(String wtype_name) {
		this.wtype_name = wtype_name;
	}

	public String getTerm() {
		return term;
	}

	public void setTerm(String term) {
		this.term = term;
	}

	public Date getWork_sdate() {
		return work_sdate;
	}

	public void setWork_sdate(Date work_sdate) {
		this.work_sdate = work_sdate;
	}

	public Date getWork_edate() {
		return work_edate;
	}

	public void setWork_edate(Date work_edate) {
		this.work_edate = work_edate;
	}

	public int getWtpye_num() {
		return wtpye_num;
	}

	public void setWtpye_num(int wtpye_num) {
		this.wtpye_num = wtpye_num;
	}

	public String getWork_content() {
		return work_content;
	}

	public void setWork_content(String work_content) {
		this.work_content = work_content;
	}

	@Override
	public String toString() {
		return "SearchTodayVo [work_num=" + work_num + ", dept_name=" + dept_name + ", emp_name=" + emp_name
				+ ", wtype_name=" + wtype_name + ", term=" + term + ", work_sdate=" + work_sdate + ", work_edate="
				+ work_edate + ", wtpye_num=" + wtpye_num + ", work_content=" + work_content + "]";
	}
	
}
