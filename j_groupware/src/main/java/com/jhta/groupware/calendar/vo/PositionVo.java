package com.jhta.groupware.calendar.vo;

public class PositionVo {
	private int pst_num;
	private String pst_name;
	
	public PositionVo() {}	
	public PositionVo(int pst_num, String pst_name) {
		this.pst_num = pst_num;
		this.pst_name = pst_name;
	}
	
	public int getPst_num() {
		return pst_num;
	}
	public void setPst_num(int pst_num) {
		this.pst_num = pst_num;
	}
	public String getPst_name() {
		return pst_name;
	}
	public void setPst_name(String pst_name) {
		this.pst_name = pst_name;
	}
	
	
}
