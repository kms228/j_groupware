package com.jhta.groupware.career.vo;

import java.util.Date;

public class CareerVo {
	private int CRR_NUM;
	private Date CRR_SDATE;
	private Date CRR_EDATE;
	private String CRR_NAME;
	private String CRR_DEPT;
	private String CRR_POSITION;
	private String CRR_WORK;
	private int EMP_NUM;
	
	public CareerVo() {}
	
	

	@Override
	public String toString() {
		return "CareerVo [CRR_NUM=" + CRR_NUM + ", CRR_SDATE=" + CRR_SDATE + ", CRR_EDATE=" + CRR_EDATE + ", CRR_NAME="
				+ CRR_NAME + ", CRR_DEPT=" + CRR_DEPT + ", CRR_POSITION=" + CRR_POSITION + ", CRR_WORK=" + CRR_WORK
				+ ", EMP_NUM=" + EMP_NUM + "]";
	}



	public CareerVo(int cRR_NUM, Date cRR_SDATE, Date cRR_EDATE, String cRR_NAME, String cRR_DEPT, String cRR_POSITION,
			String cRR_WORK, int eMP_NUM) {
		super();
		CRR_NUM = cRR_NUM;
		CRR_SDATE = cRR_SDATE;
		CRR_EDATE = cRR_EDATE;
		CRR_NAME = cRR_NAME;
		CRR_DEPT = cRR_DEPT;
		CRR_POSITION = cRR_POSITION;
		CRR_WORK = cRR_WORK;
		EMP_NUM = eMP_NUM;
	}



	public int getCRR_NUM() {
		return CRR_NUM;
	}

	public void setCRR_NUM(int cRR_NUM) {
		CRR_NUM = cRR_NUM;
	}

	public Date getCRR_SDATE() {
		return CRR_SDATE;
	}

	public void setCRR_SDATE(Date cRR_SDATE) {
		CRR_SDATE = cRR_SDATE;
	}

	public Date getCRR_EDATE() {
		return CRR_EDATE;
	}

	public void setCRR_EDATE(Date cRR_EDATE) {
		CRR_EDATE = cRR_EDATE;
	}

	public String getCRR_NAME() {
		return CRR_NAME;
	}

	public void setCRR_NAME(String cRR_NAME) {
		CRR_NAME = cRR_NAME;
	}

	public String getCRR_DEPT() {
		return CRR_DEPT;
	}

	public void setCRR_DEPT(String cRR_DEPT) {
		CRR_DEPT = cRR_DEPT;
	}

	public String getCRR_POSITION() {
		return CRR_POSITION;
	}

	public void setCRR_POSITION(String cRR_POSITION) {
		CRR_POSITION = cRR_POSITION;
	}

	public String getCRR_WORK() {
		return CRR_WORK;
	}

	public void setCRR_WORK(String cRR_WORK) {
		CRR_WORK = cRR_WORK;
	}

	public int getEMP_NUM() {
		return EMP_NUM;
	}

	public void setEMP_NUM(int eMP_NUM) {
		EMP_NUM = eMP_NUM;
	}
	
	
	
}
