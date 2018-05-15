package com.jhta.groupware.emplist.vo;

import java.util.Date;

public class NboardListVo {
	private int b_num;
	private String b_title;
	private String b_writer;
	private String b_content;
	private Date b_date;
	private int emp_num;
	
	public NboardListVo() {}
	
	public int getB_num() {
		return b_num;
	}
	public void setB_num(int b_num) {
		this.b_num = b_num;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_writer() {
		return b_writer;
	}
	public void setB_writer(String b_writer) {
		this.b_writer = b_writer;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public Date getB_date() {
		return b_date;
	}
	public void setB_date(Date b_date) {
		this.b_date = b_date;
	}
	public int getEmp_num() {
		return emp_num;
	}
	public void setEmp_num(int emp_num) {
		this.emp_num = emp_num;
	}
	@Override
	public String toString() {
		return "NboardListVo [b_num=" + b_num + ", b_title=" + b_title + ", b_writer=" + b_writer + ", b_content="
				+ b_content + ", b_date=" + b_date + ", emp_num=" + emp_num + "]";
	}
	public NboardListVo(int b_num, String b_title, String b_writer, String b_content, Date b_date, int emp_num) {
		super();
		this.b_num = b_num;
		this.b_title = b_title;
		this.b_writer = b_writer;
		this.b_content = b_content;
		this.b_date = b_date;
		this.emp_num = emp_num;
	}
	
	
	
}
