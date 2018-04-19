package com.jhta.groupware.sign.vo;

public class SdocLineVo {
	private int sline_num;
	private int sline_level;
	private int sline_state;
	private int emp_num;
	private int sdoc_num;
	public SdocLineVo(int sline_num, int sline_level, int sline_state, int emp_num, int sdoc_num) {
		super();
		this.sline_num = sline_num;
		this.sline_level = sline_level;
		this.sline_state = sline_state;
		this.emp_num = emp_num;
		this.sdoc_num = sdoc_num;
	}
	public SdocLineVo() {
		super();
	}
	public int getSline_num() {
		return sline_num;
	}
	public void setSline_num(int sline_num) {
		this.sline_num = sline_num;
	}
	public int getSline_level() {
		return sline_level;
	}
	public void setSline_level(int sline_level) {
		this.sline_level = sline_level;
	}
	public int getSline_state() {
		return sline_state;
	}
	public void setSline_state(int sline_state) {
		this.sline_state = sline_state;
	}
	public int getEmp_num() {
		return emp_num;
	}
	public void setEmp_num(int emp_num) {
		this.emp_num = emp_num;
	}
	public int getSdoc_num() {
		return sdoc_num;
	}
	public void setSdoc_num(int sdoc_num) {
		this.sdoc_num = sdoc_num;
	}
	
	
}
