package com.jhta.groupware.position.vo;

public class PositionVo {
	private int PST_NUM;
	private String PST_NAME;
	
	public PositionVo() {}

	@Override
	public String toString() {
		return "PositionVo [PST_NUM=" + PST_NUM + ", PST_NAME=" + PST_NAME + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}

	public PositionVo(int pST_NUM, String pST_NAME) {
		super();
		PST_NUM = pST_NUM;
		PST_NAME = pST_NAME;
	}

	public int getPST_NUM() {
		return PST_NUM;
	}

	public void setPST_NUM(int pST_NUM) {
		PST_NUM = pST_NUM;
	}

	public String getPST_NAME() {
		return PST_NAME;
	}

	public void setPST_NAME(String pST_NAME) {
		PST_NAME = pST_NAME;
	}
	
	
}
