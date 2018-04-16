package com.jhta.groupware.work.vo;

import java.sql.Date;

public class WorkListVo {
	private int wlist_num;
	private Date wlist_start;
	private Date wlist_end;
	private int wlist_type;
	private int emp_num;
	
	public WorkListVo() {}

	public WorkListVo(int wlist_num, Date wlist_start, Date wlist_end, int wlist_type, int emp_num) {
		super();
		this.wlist_num = wlist_num;
		this.wlist_start = wlist_start;
		this.wlist_end = wlist_end;
		this.wlist_type = wlist_type;
		this.emp_num = emp_num;
	}

	public int getWlist_num() {
		return wlist_num;
	}

	public void setWlist_num(int wlist_num) {
		this.wlist_num = wlist_num;
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

	public int getWlist_type() {
		return wlist_type;
	}

	public void setWlist_type(int wlist_type) {
		this.wlist_type = wlist_type;
	}

	public int getEmp_num() {
		return emp_num;
	}

	public void setEmp_num(int emp_num) {
		this.emp_num = emp_num;
	}

	@Override
	public String toString() {
		return "WorkListVo [wlist_num=" + wlist_num + ", wlist_start=" + wlist_start + ", wlist_end=" + wlist_end
				+ ", wlist_type=" + wlist_type + ", emp_num=" + emp_num + "]";
	}
	
	
}
