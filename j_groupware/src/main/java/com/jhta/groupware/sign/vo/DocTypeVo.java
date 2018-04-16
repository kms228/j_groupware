package com.jhta.groupware.sign.vo;

public class DocTypeVo {
	private int doc_num;
	private String doc_name;
	private String doc_content;
	public DocTypeVo(int doc_num, String doc_name, String doc_content) {
		super();
		this.doc_num = doc_num;
		this.doc_name = doc_name;
		this.doc_content = doc_content;
	}
	public DocTypeVo() {
		super();
	}
	public int getDoc_num() {
		return doc_num;
	}
	public void setDoc_num(int doc_num) {
		this.doc_num = doc_num;
	}
	public String getDoc_name() {
		return doc_name;
	}
	public void setDoc_name(String doc_name) {
		this.doc_name = doc_name;
	}
	public String getDoc_content() {
		return doc_content;
	}
	public void setDoc_content(String doc_content) {
		this.doc_content = doc_content;
	}
	@Override
	public String toString() {
		return "DocTypeVo [doc_num=" + doc_num + ", doc_name=" + doc_name + ", doc_content=" + doc_content + "]";
	}
	
}
