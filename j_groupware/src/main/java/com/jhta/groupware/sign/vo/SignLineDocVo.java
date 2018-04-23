package com.jhta.groupware.sign.vo;
//결재문서 vo

import java.sql.Date;

public class SignLineDocVo {
	private int doc_num;
	private Date sdoc_date;
	private int sdoc_num;
	private String sdoc_title;
	private int sdoc_state;
	private int sline_num;
	private int sline_state;
	private int slemp;
	private int sdemp;
	private String doc_name;
	private String emp_name;
	private String dept_name;
	
	public SignLineDocVo(int doc_num, Date sdoc_date, int sdoc_num, String sdoc_title, int sdoc_state, int sline_num,
			int sline_state, int slemp, int sdemp, String doc_name, String emp_name, String dept_name) {
		super();
		this.doc_num = doc_num;
		this.sdoc_date = sdoc_date;
		this.sdoc_num = sdoc_num;
		this.sdoc_title = sdoc_title;
		this.sdoc_state = sdoc_state;
		this.sline_num = sline_num;
		this.sline_state = sline_state;
		this.slemp = slemp;
		this.sdemp = sdemp;
		this.doc_name = doc_name;
		this.emp_name = emp_name;
		this.dept_name = dept_name;
	}
	
	public SignLineDocVo() {
		super();
	}

	public int getDoc_num() {
		return doc_num;
	}
	public void setDoc_num(int doc_num) {
		this.doc_num = doc_num;
	}
	public Date getSdoc_date() {
		return sdoc_date;
	}
	public void setSdoc_date(Date sdoc_date) {
		this.sdoc_date = sdoc_date;
	}
	public int getSdoc_num() {
		return sdoc_num;
	}
	public void setSdoc_num(int sdoc_num) {
		this.sdoc_num = sdoc_num;
	}
	public String getSdoc_title() {
		return sdoc_title;
	}
	public void setSdoc_title(String sdoc_title) {
		this.sdoc_title = sdoc_title;
	}
	public int getSdoc_state() {
		return sdoc_state;
	}
	public void setSdoc_state(int sdoc_state) {
		this.sdoc_state = sdoc_state;
	}
	public int getSline_num() {
		return sline_num;
	}
	public void setSline_num(int sline_num) {
		this.sline_num = sline_num;
	}
	public int getSline_state() {
		return sline_state;
	}
	public void setSline_state(int sline_state) {
		this.sline_state = sline_state;
	}
	public int getSlemp() {
		return slemp;
	}
	public void setSlemp(int slemp) {
		this.slemp = slemp;
	}
	public int getSdemp() {
		return sdemp;
	}
	public void setSdemp(int sdemp) {
		this.sdemp = sdemp;
	}
	public String getDoc_name() {
		return doc_name;
	}
	public void setDoc_name(String doc_name) {
		this.doc_name = doc_name;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public String getDept_name() {
		return dept_name;
	}
	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}

	@Override
	public String toString() {
		return "SignLineDocVo [doc_num=" + doc_num + ", sdoc_date=" + sdoc_date + ", sdoc_num=" + sdoc_num
				+ ", sdoc_title=" + sdoc_title + ", sdoc_state=" + sdoc_state + ", sline_num=" + sline_num
				+ ", sline_state=" + sline_state + ", slemp=" + slemp + ", sdemp=" + sdemp + ", doc_name=" + doc_name
				+ ", emp_name=" + emp_name + ", dept_name=" + dept_name + "]";
	}
	
	
}
