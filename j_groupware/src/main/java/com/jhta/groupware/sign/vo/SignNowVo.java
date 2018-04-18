package com.jhta.groupware.sign.vo;

import java.sql.Date;

public class SignNowVo {
	private int sdoc_num;
	private String doc_name;
	private String sdoc_title;
	private String emp_name;
	private int emp_num;
	private Date sdoc_date;
	private String dept_name;
	public SignNowVo(int sdoc_num, String doc_name, String sdoc_title, String emp_name, int emp_num, Date sdoc_date,
			String dept_name) {
		super();
		this.sdoc_num = sdoc_num;
		this.doc_name = doc_name;
		this.sdoc_title = sdoc_title;
		this.emp_name = emp_name;
		this.emp_num = emp_num;
		this.sdoc_date = sdoc_date;
		this.dept_name = dept_name;
	}
	public SignNowVo() {
		super();
	}
	public int getSdoc_num() {
		return sdoc_num;
	}
	public void setSdoc_num(int sdoc_num) {
		this.sdoc_num = sdoc_num;
	}
	public String getDoc_name() {
		return doc_name;
	}
	public void setDoc_name(String doc_name) {
		this.doc_name = doc_name;
	}
	public String getSdoc_title() {
		return sdoc_title;
	}
	public void setSdoc_title(String sdoc_title) {
		this.sdoc_title = sdoc_title;
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
	public Date getSdoc_date() {
		return sdoc_date;
	}
	public void setSdoc_date(Date sdoc_date) {
		this.sdoc_date = sdoc_date;
	}
	public String getDept_name() {
		return dept_name;
	}
	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}

}
