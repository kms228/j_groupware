package com.jhta.groupware.home.vo;

import java.util.Date;

public class MyWorkListVo {
	private String emp_name;
	private Date wlist_start;
	private Date wlist_end;
	private int wlist_type;
	private int emp_num;
	
	public MyWorkListVo() {}	
	public MyWorkListVo(String emp_name, Date wlist_start, Date wlist_end, int wlist_type, int emp_num) {
		this.emp_name = emp_name;
		this.wlist_start = wlist_start;
		this.wlist_end = wlist_end;
		this.wlist_type = wlist_type;
		this.emp_num = emp_num;
	}
	
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
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
}
