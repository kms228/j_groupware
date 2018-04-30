package com.jhta.groupware.acadeemic.vo;

import java.util.Date;

public class AcademicVo {
	private int ACD_NUM;
	private Date ACD_GRADUATION;
	private String ACD_NAME;
	private String ACD_MAJOR;
	private String ACD_SCORE;
	private int EMP_NUM;
	
	public AcademicVo () {}
	
	

	@Override
	public String toString() {
		return "AcademicVo [ACD_NUM=" + ACD_NUM + ", ACD_GRADUATION=" + ACD_GRADUATION + ", ACD_NAME=" + ACD_NAME
				+ ", ACD_MAJOR=" + ACD_MAJOR + ", ACD_SCORE=" + ACD_SCORE + ", EMP_NUM=" + EMP_NUM + "]";
	}



	public AcademicVo(int aCD_NUM, Date aCD_GRADUATION, String aCD_NAME, String aCD_MAJOR, String aCD_SCORE,
			int eMP_NUM) {
		super();
		ACD_NUM = aCD_NUM;
		ACD_GRADUATION = aCD_GRADUATION;
		ACD_NAME = aCD_NAME;
		ACD_MAJOR = aCD_MAJOR;
		ACD_SCORE = aCD_SCORE;
		EMP_NUM = eMP_NUM;
	}



	public int getACD_NUM() {
		return ACD_NUM;
	}

	public void setACD_NUM(int aCD_NUM) {
		ACD_NUM = aCD_NUM;
	}

	public Date getACD_GRADUATION() {
		return ACD_GRADUATION;
	}

	public void setACD_GRADUATION(Date aCD_GRADUATION) {
		ACD_GRADUATION = aCD_GRADUATION;
	}

	public String getACD_NAME() {
		return ACD_NAME;
	}

	public void setACD_NAME(String aCD_NAME) {
		ACD_NAME = aCD_NAME;
	}

	public String getACD_MAJOR() {
		return ACD_MAJOR;
	}

	public void setACD_MAJOR(String aCD_MAJOR) {
		ACD_MAJOR = aCD_MAJOR;
	}

	public String getACD_SCORE() {
		return ACD_SCORE;
	}

	public void setACD_SCORE(String aCD_SCORE) {
		ACD_SCORE = aCD_SCORE;
	}

	public int getEMP_NUM() {
		return EMP_NUM;
	}

	public void setEMP_NUM(int eMP_NUM) {
		EMP_NUM = eMP_NUM;
	}
	
	
}
