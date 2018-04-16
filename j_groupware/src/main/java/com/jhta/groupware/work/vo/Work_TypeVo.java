package com.jhta.groupware.work.vo;

public class Work_TypeVo {
	private int wtype_num;
	private String wtype_name;
	
	public Work_TypeVo() {}

	public Work_TypeVo(int wtype_num, String wtype_name) {
		super();
		this.wtype_num = wtype_num;
		this.wtype_name = wtype_name;
	}

	public int getWtype_num() {
		return wtype_num;
	}

	public void setWtype_num(int wtype_num) {
		this.wtype_num = wtype_num;
	}

	public String getWtype_name() {
		return wtype_name;
	}

	public void setWtype_name(String wtype_name) {
		this.wtype_name = wtype_name;
	}

	@Override
	public String toString() {
		return "Work_TypeVo [wtype_num=" + wtype_num + ", wtype_name=" + wtype_name + "]";
	}
	
}
