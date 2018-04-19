package com.jhta.groupware.sign.vo;

public class SignDocVo {
	private int sdoc_num;
	private int sdoc_state;
	private String sdoc_title;
	private String sdoc_content;
	private int emp_num;
	private int doc_num;
	public SignDocVo(int sdoc_num, int sdoc_state, String sdoc_title, String sdoc_content, int emp_num, int doc_num) {
		super();
		this.sdoc_num = sdoc_num;
		this.sdoc_state = sdoc_state;
		this.sdoc_title = sdoc_title;
		this.sdoc_content = sdoc_content;
		this.emp_num = emp_num;
		this.doc_num = doc_num;
	}
	public SignDocVo() {
		super();
	}
	public int getSdoc_num() {
		return sdoc_num;
	}
	public void setSdoc_num(int sdoc_num) {
		this.sdoc_num = sdoc_num;
	}
	public int getSdoc_state() {
		return sdoc_state;
	}
	public void setSdoc_state(int sdoc_state) {
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
	
	
}
