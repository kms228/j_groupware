package com.jhta.groupware.sign.vo;

import java.sql.Date;

public class SignVo {
	private int sdoc_num;
	private String sdoc_state;
	private String sdoc_title;
	private String sdoc_content;
	private Date sdoc_date;
	private int emp_num;
	private int doc_num;
	
	public SignVo(int sdoc_num, String sdoc_state, String sdoc_title, String sdoc_content, Date sdoc_date, int emp_num,
			int doc_num) {
		super();
		this.sdoc_num = sdoc_num;
		this.sdoc_state = sdoc_state;
		this.sdoc_title = sdoc_title;
		this.sdoc_content = sdoc_content;
		this.sdoc_date = sdoc_date;
		this.emp_num = emp_num;
		this.doc_num = doc_num;
	}
	public SignVo() {
		super();
	}
	public int getSdoc_num() {
		return sdoc_num;
	}
	public void setSdoc_num(int sdoc_num) {
		this.sdoc_num = sdoc_num;
	}
	public String getSdoc_state() {
		return sdoc_state;
	}
	public void setSdoc_state(String sdoc_state) {
		this.sdoc_state = sdoc_state;
	}
	public String getSdoc_title() {
		return sdoc_title;
	}
	public void setSdoc_title(String sdoc_title) {
		this.sdoc_title = sdoc_title;
	}
	public String getSdoc_content() {
		return sdoc_content;
	}
	public void setSdoc_content(String sdoc_content) {
		this.sdoc_content = sdoc_content;
	}
	public Date getSdoc_date() {
		return sdoc_date;
	}
	public void setSdoc_date(Date sdoc_date) {
		this.sdoc_date = sdoc_date;
	}
	public int getEmp_num() {
		return emp_num;
	}
	public void setEmp_num(int emp_num) {
		this.emp_num = emp_num;
	}
	public int getDoc_num() {
		return doc_num;
	}
	public void setDoc_num(int doc_num) {
		this.doc_num = doc_num;
	}
	@Override
	public String toString() {
		return "SignVo [sdoc_num=" + sdoc_num + ", sdoc_state=" + sdoc_state + ", sdoc_title=" + sdoc_title
				+ ", sdoc_content=" + sdoc_content + ", sdoc_date=" + sdoc_date + ", emp_num=" + emp_num + ", doc_num="
				+ doc_num + "]";
	}
	
}
