package com.jhta.groupware.emplist.vo;

import java.util.Date;

public class EmpListVo {
	private int EMP_NUM;
	private String EMP_NAME;
	private String EMP_PHONE;
	private String EMP_EMAIL;
	private Date EMP_HIREDATE;
	private String DEPT_NAME;
	private String PST_NAME;
	private int ACNT_LEVEL;
	
	public EmpListVo() {}

	@Override
	public String toString() {
		return "EmpListVo [EMP_NUM=" + EMP_NUM + ", EMP_NAME=" + EMP_NAME + ", EMP_PHONE=" + EMP_PHONE + ", EMP_EMAIL="
				+ EMP_EMAIL + ", EMP_HIREDATE=" + EMP_HIREDATE + ", DEPT_NAME=" + DEPT_NAME + ", PST_NAME=" + PST_NAME
				+ ", ACNT_LEVEL=" + ACNT_LEVEL + "]";
	}

	public EmpListVo(int eMP_NUM, String eMP_NAME, String eMP_PHONE, String eMP_EMAIL, Date eMP_HIREDATE,
			String dEPT_NAME, String pST_NAME, int aCNT_LEVEL) {
		super();
		EMP_NUM = eMP_NUM;
		EMP_NAME = eMP_NAME;
		EMP_PHONE = eMP_PHONE;
		EMP_EMAIL = eMP_EMAIL;
		EMP_HIREDATE = eMP_HIREDATE;
		DEPT_NAME = dEPT_NAME;
		PST_NAME = pST_NAME;
		ACNT_LEVEL = aCNT_LEVEL;
	}

	public int getEMP_NUM() {
		return EMP_NUM;
	}

	public void setEMP_NUM(int eMP_NUM) {
		EMP_NUM = eMP_NUM;
	}

	public String getEMP_NAME() {
		return EMP_NAME;
	}

	public void setEMP_NAME(String eMP_NAME) {
		EMP_NAME = eMP_NAME;
	}

	public String getEMP_PHONE() {
		return EMP_PHONE;
	}

	public void setEMP_PHONE(String eMP_PHONE) {
		EMP_PHONE = eMP_PHONE;
	}

	public String getEMP_EMAIL() {
		return EMP_EMAIL;
	}

	public void setEMP_EMAIL(String eMP_EMAIL) {
		EMP_EMAIL = eMP_EMAIL;
	}

	public Date getEMP_HIREDATE() {
		return EMP_HIREDATE;
	}

	public void setEMP_HIREDATE(Date eMP_HIREDATE) {
		EMP_HIREDATE = eMP_HIREDATE;
	}

	public String getDEPT_NAME() {
		return DEPT_NAME;
	}

	public void setDEPT_NAME(String dEPT_NAME) {
		DEPT_NAME = dEPT_NAME;
	}

	public String getPST_NAME() {
		return PST_NAME;
	}

	public void setPST_NAME(String pST_NAME) {
		PST_NAME = pST_NAME;
	}

	public int getACNT_LEVEL() {
		return ACNT_LEVEL;
	}

	public void setACNT_LEVEL(int aCNT_LEVEL) {
		ACNT_LEVEL = aCNT_LEVEL;
	}

	
}
