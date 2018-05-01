package com.jhta.groupware.history.vo;

import java.util.Date;

public class HistoryVo {
	private int HIS_NUM;
	private Date HIS_DATE;
	private String HIS_DEPT;
	private String HIS_POSITION;
	private String HIS_WORK;
	private int EMP_NEM;
	
	public HistoryVo() {}

	@Override
	public String toString() {
		return "HistoryVo [HIS_NUM=" + HIS_NUM + ", HIS_DATE=" + HIS_DATE + ", HIS_DEPT=" + HIS_DEPT + ", HIS_POSITION="
				+ HIS_POSITION + ", HIS_WORK=" + HIS_WORK + ", EMP_NEM=" + EMP_NEM + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}

	public HistoryVo(int hIS_NUM, Date hIS_DATE, String hIS_DEPT, String hIS_POSITION, String hIS_WORK, int eMP_NEM) {
		super();
		HIS_NUM = hIS_NUM;
		HIS_DATE = hIS_DATE;
		HIS_DEPT = hIS_DEPT;
		HIS_POSITION = hIS_POSITION;
		HIS_WORK = hIS_WORK;
		EMP_NEM = eMP_NEM;
	}

	public int getHIS_NUM() {
		return HIS_NUM;
	}

	public void setHIS_NUM(int hIS_NUM) {
		HIS_NUM = hIS_NUM;
	}

	public Date getHIS_DATE() {
		return HIS_DATE;
	}

	public void setHIS_DATE(Date hIS_DATE) {
		HIS_DATE = hIS_DATE;
	}

	public String getHIS_DEPT() {
		return HIS_DEPT;
	}

	public void setHIS_DEPT(String hIS_DEPT) {
		HIS_DEPT = hIS_DEPT;
	}

	public String getHIS_POSITION() {
		return HIS_POSITION;
	}

	public void setHIS_POSITION(String hIS_POSITION) {
		HIS_POSITION = hIS_POSITION;
	}

	public String getHIS_WORK() {
		return HIS_WORK;
	}

	public void setHIS_WORK(String hIS_WORK) {
		HIS_WORK = hIS_WORK;
	}

	public int getEMP_NEM() {
		return EMP_NEM;
	}

	public void setEMP_NEM(int eMP_NEM) {
		EMP_NEM = eMP_NEM;
	}
	
	
}
