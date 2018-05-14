package com.jhta.groupware.work.vo;

import java.util.Date;

public class SearchResponseListVo {
	private int wline_num;
	private int wline_level;
	private int wline_state;
	private int work_num;
	private int emp_num;
	private String work_content;
	private String emp_name;
	private String regdate;
	private Date work_regdate;
	private String wfile_orgfilename;
	private int wtype_num;
	private String caldate;
	private String term;
	private String wtype;
	private int wfile_num;
	
	public SearchResponseListVo() {}

	public SearchResponseListVo(int wline_num, int wline_level, int wline_state, int work_num, int emp_num,
			String work_content, String emp_name, String regdate, Date work_regdate, String wfile_orgfilename,
			int wtype_num, String caldate, String term, String wtype, int wfile_num) {
		super();
		this.wline_num = wline_num;
		this.wline_level = wline_level;
		this.wline_state = wline_state;
		this.work_num = work_num;
		this.emp_num = emp_num;
		this.work_content = work_content;
		this.emp_name = emp_name;
		this.regdate = regdate;
		this.work_regdate = work_regdate;
		this.wfile_orgfilename = wfile_orgfilename;
		this.wtype_num = wtype_num;
		this.caldate = caldate;
		this.term = term;
		this.wtype = wtype;
		this.wfile_num = wfile_num;
	}

	public int getWline_num() {
		return wline_num;
	}

	public void setWline_num(int wline_num) {
		this.wline_num = wline_num;
	}

	public int getWline_level() {
		return wline_level;
	}

	public void setWline_level(int wline_level) {
		this.wline_level = wline_level;
	}

	public int getWline_state() {
		return wline_state;
	}

	public void setWline_state(int wline_state) {
		this.wline_state = wline_state;
	}

	public int getWork_num() {
		return work_num;
	}

	public void setWork_num(int work_num) {
		this.work_num = work_num;
	}

	public int getEmp_num() {
		return emp_num;
	}

	public void setEmp_num(int emp_num) {
		this.emp_num = emp_num;
	}

	public String getWork_content() {
		return work_content;
	}

	public void setWork_content(String work_content) {
		this.work_content = work_content;
	}

	public String getEmp_name() {
		return emp_name;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public Date getWork_regdate() {
		return work_regdate;
	}

	public void setWork_regdate(Date work_regdate) {
		this.work_regdate = work_regdate;
	}

	public String getWfile_orgfilename() {
		return wfile_orgfilename;
	}

	public void setWfile_orgfilename(String wfile_orgfilename) {
		this.wfile_orgfilename = wfile_orgfilename;
	}

	public int getWtype_num() {
		return wtype_num;
	}

	public void setWtype_num(int wtype_num) {
		this.wtype_num = wtype_num;
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

	public String getWtype() {
		return wtype;
	}

	public void setWtype(String wtype) {
		this.wtype = wtype;
	}

	public int getWfile_num() {
		return wfile_num;
	}

	public void setWfile_num(int wfile_num) {
		this.wfile_num = wfile_num;
	}

	@Override
	public String toString() {
		return "SearchResponseListVo [wline_num=" + wline_num + ", wline_level=" + wline_level + ", wline_state="
				+ wline_state + ", work_num=" + work_num + ", emp_num=" + emp_num + ", work_content=" + work_content
				+ ", emp_name=" + emp_name + ", regdate=" + regdate + ", work_regdate=" + work_regdate
				+ ", wfile_orgfilename=" + wfile_orgfilename + ", wtype_num=" + wtype_num + ", caldate=" + caldate
				+ ", term=" + term + ", wtype=" + wtype + ", wfile_num=" + wfile_num + "]";
	}

}
