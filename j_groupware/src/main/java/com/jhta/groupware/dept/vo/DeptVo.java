package com.jhta.groupware.dept.vo;

public class DeptVo {
	private int DEPT_NUM;
	private String DEPT_NAME;
	
	public DeptVo() {}

	@Override
	public String toString() {
		return "DeptVo [DEPT_NUM=" + DEPT_NUM + ", DEPT_NAME=" + DEPT_NAME + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}

	public DeptVo(int dEPT_NUM, String dEPT_NAME) {
		super();
		DEPT_NUM = dEPT_NUM;
		DEPT_NAME = dEPT_NAME;
	}

	public int getDEPT_NUM() {
		return DEPT_NUM;
	}

	public void setDEPT_NUM(int dEPT_NUM) {
		DEPT_NUM = dEPT_NUM;
	}

	public String getDEPT_NAME() {
		return DEPT_NAME;
	}

	public void setDEPT_NAME(String dEPT_NAME) {
		DEPT_NAME = dEPT_NAME;
	}
	
	
}
