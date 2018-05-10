package com.jhta.groupware.work.vo;

import java.util.Date;

public class SearchWorkListVo {
	private int wlist_num;
	private int emp_num;
	private String emp_name;
	private int wlist_type;
	private Date wlist_start;
	private Date wlist_end;
	
	public SearchWorkListVo() {}

	public SearchWorkListVo(int wlist_num, int emp_num, String emp_name, int wlist_type, Date wlist_start,
			Date wlist_end) {
		super();
		this.wlist_num = wlist_num;
		this.emp_num = emp_num;
		this.emp_name = emp_name;
		this.wlist_type = wlist_type;
		this.wlist_start = wlist_start;
		this.wlist_end = wlist_end;
	}

	public int getWlist_num() {
		return wlist_num;
	}

	public void setWlist_num(int wlist_num) {
		this.wlist_num = wlist_num;
	}

	public int getEmp_num() {
		return emp_num;
	}

	public void setEmp_num(int emp_num) {
		this.emp_num = emp_num;
	}

	public String getEmp_name() {
		return emp_name;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}

	public int getWlist_type() {
		return wlist_type;
	}

	public void setWlist_type(int wlist_type) {
		this.wlist_type = wlist_type;
	}

	public Date getWlist_start() {
		return wlist_start;
	}

	public void setWlist_start(Date wlist_start) {
		this.wlist_start = wlist_start;
	}

	public Date getWlist_end() {
		return wlist_end;
	}

	public void setWlist_end(Date wlist_end) {
		this.wlist_end = wlist_end;
	}

	@Override
	public String toString() {
		return "SearchWorkListVo [wlist_num=" + wlist_num + ", emp_num=" + emp_num + ", emp_name=" + emp_name
				+ ", wlist_type=" + wlist_type + ", wlist_start=" + wlist_start + ", wlist_end=" + wlist_end + "]";
	}
	

}
