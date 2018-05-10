package com.jhta.groupware.login.vo;


public class LoginVo {
	private int EMP_NUM;
	private String EMP_NAME;
	private String EMP_PHONE;
	private String EMP_ADDR;
	private String EMP_BIRTH;
	private String EMP_EMAIL;
	private String EMP_HIREDATE;
	private String EMP_GENDER;
	private String PST_NUM;
	private String DEPT_NUM;
	private String TEAM_NUM;
	private int WORKING;
	
	public LoginVo() {}
	
	

	@Override
	public String toString() {
		return "LoginVo [EMP_NUM=" + EMP_NUM + ", EMP_NAME=" + EMP_NAME + ", EMP_PHONE=" + EMP_PHONE + ", EMP_ADDR="
				+ EMP_ADDR + ", EMP_BIRTH=" + EMP_BIRTH + ", EMP_EMAIL=" + EMP_EMAIL + ", EMP_HIREDATE=" + EMP_HIREDATE
				+ ", EMP_GENDER=" + EMP_GENDER + ", PST_NUM=" + PST_NUM + ", DEPT_NUM=" + DEPT_NUM + ", TEAM_NUM="
				+ TEAM_NUM + ", WORKING=" + WORKING + "]\n";
	}



	public LoginVo(int eMP_NUM, String eMP_NAME, String eMP_PHONE, String eMP_ADDR, String eMP_BIRTH, String eMP_EMAIL,
			String eMP_HIREDATE, String eMP_GENDER, String pST_NUM, String dEPT_NUM, String tEAM_NUM, int wORKING) {
		super();
		EMP_NUM = eMP_NUM;
		EMP_NAME = eMP_NAME;
		EMP_PHONE = eMP_PHONE;
		EMP_ADDR = eMP_ADDR;
		EMP_BIRTH = eMP_BIRTH;
		EMP_EMAIL = eMP_EMAIL;
		EMP_HIREDATE = eMP_HIREDATE;
		EMP_GENDER = eMP_GENDER;
		PST_NUM = pST_NUM;
		DEPT_NUM = dEPT_NUM;
		TEAM_NUM = tEAM_NUM;
		WORKING = wORKING;
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

	public String getEMP_ADDR() {
		return EMP_ADDR;
	}

	public void setEMP_ADDR(String eMP_ADDR) {
		EMP_ADDR = eMP_ADDR;
	}

	public String getEMP_BIRTH() {
		return EMP_BIRTH;
	}

	public void setEMP_BIRTH(String eMP_BIRTH) {
		EMP_BIRTH = eMP_BIRTH;
	}

	public String getEMP_EMAIL() {
		return EMP_EMAIL;
	}

	public void setEMP_EMAIL(String eMP_EMAIL) {
		EMP_EMAIL = eMP_EMAIL;
	}

	public String getEMP_HIREDATE() {
		return EMP_HIREDATE;
	}

	public void setEMP_HIREDATE(String eMP_HIREDATE) {
		EMP_HIREDATE = eMP_HIREDATE;
	}

	public String getEMP_GENDER() {
		return EMP_GENDER;
	}

	public void setEMP_GENDER(String eMP_GENDER) {
		EMP_GENDER = eMP_GENDER;
	}

	public String getPST_NUM() {
		return PST_NUM;
	}

	public void setPST_NUM(String pST_NUM) {
		PST_NUM = pST_NUM;
	}

	public String getDEPT_NUM() {
		return DEPT_NUM;
	}

	public void setDEPT_NUM(String dEPT_NUM) {
		DEPT_NUM = dEPT_NUM;
	}

	public String getTEAM_NUM() {
		return TEAM_NUM;
	}

	public void setTEAM_NUM(String tEAM_NUM) {
		TEAM_NUM = tEAM_NUM;
	}

	public int getWORKING() {
		return WORKING;
	}

	public void setWORKING(int wORKING) {
		WORKING = wORKING;
	}
	
	
}