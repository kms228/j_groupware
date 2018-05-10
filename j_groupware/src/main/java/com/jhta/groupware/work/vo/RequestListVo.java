package com.jhta.groupware.work.vo;

import java.util.Date;

public class RequestListVo {
	private int work_num;
	private Date work_sdate;
	private Date work_edate;
	private String work_content;
	private Date work_regdate;
	private int work_state;
	private int wtype_num;
	private String wfile_orgfilename;
	private String emp_name;
	private int emp_num;
	private String caldate;
	private String term;
	private String wtype_name;
	private String regdate;
	
	public RequestListVo() {}

	public RequestListVo(int work_num, Date work_sdate, Date work_edate, String work_content, Date work_regdate,
			int work_state, int wtype_num, String wfile_orgfilename, String emp_name, int emp_num, String caldate,
			String term, String wtype_name, String regdate) {
		super();
		this.work_num = work_num;
		this.work_sdate = work_sdate;
		this.work_edate = work_edate;
		this.work_content = work_content;
		this.work_regdate = work_regdate;
		this.work_state = work_state;
		this.wtype_num = wtype_num;
		this.wfile_orgfilename = wfile_orgfilename;
		this.emp_name = emp_name;
		this.emp_num = emp_num;
		this.caldate = caldate;
		this.term = term;
		this.wtype_name = wtype_name;
		this.regdate = regdate;
	}

	public int getWork_num() {
		return work_num;
	}

	public void setWork_num(int work_num) {
		this.work_num = work_num;
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

	public String getWork_content() {
		return work_content;
	}

	public void setWork_content(String work_content) {
		this.work_content = work_content;
	}

	public Date getWork_regdate() {
		return work_regdate;
	}

	public void setWork_regdate(Date work_regdate) {
		this.work_regdate = work_regdate;
	}

	public int getWork_state() {
		return work_state;
	}

	public void setWork_state(int work_state) {
		this.work_state = work_state;
	}

	public int getWtype_num() {
		return wtype_num;
	}

	public void setWtype_num(int wtype_num) {
		this.wtype_num = wtype_num;
	}

	public String getWfile_orgfilename() {
		return wfile_orgfilename;
	}

	public void setWfile_orgfilename(String wfile_orgfilename) {
		this.wfile_orgfilename = wfile_orgfilename;
	}

	public String getEmp_name() {
		return emp_name;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}

	public int getEmp_num() {
		return emp_num;
	}

	public void setEmp_num(int emp_num) {
		this.emp_num = emp_num;
	}

	public String getCaldate() {
		return caldate;
	}

	public void setCaldate(String caldate) {
		this.caldate = caldate;
	}

	public String getTerm() {
		return term;
	}

	public void setTerm(String term) {
		this.term = term;
	}

	public String getWtype_name() {
		return wtype_name;
	}

	public void setWtype_name(String wtype_name) {
		this.wtype_name = wtype_name;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "RequestListVo [work_num=" + work_num + ", work_sdate=" + work_sdate + ", work_edate=" + work_edate
				+ ", work_content=" + work_content + ", work_regdate=" + work_regdate + ", work_state=" + work_state
				+ ", wtype_num=" + wtype_num + ", wfile_orgfilename=" + wfile_orgfilename + ", emp_name=" + emp_name
				+ ", emp_num=" + emp_num + ", caldate=" + caldate + ", term=" + term + ", wtype_name=" + wtype_name
				+ ", regdate=" + regdate + "]";
	}

}
