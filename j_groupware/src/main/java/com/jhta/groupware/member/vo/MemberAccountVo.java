package com.jhta.groupware.member.vo;

public class MemberAccountVo {
	private int ACNT_NUM;
	private String ACNT_id;
	private String ACNT_pwd;
	private int ACNT_level;
	private int EMP_NUM;
	
	public MemberAccountVo() {}

	public MemberAccountVo(int aCNT_NUM, String aCNT_id, String aCNT_pwd, int aCNT_level, int eMP_NUM) {
		super();
		ACNT_NUM = aCNT_NUM;
		ACNT_id = aCNT_id;
		ACNT_pwd = aCNT_pwd;
		ACNT_level = aCNT_level;
		EMP_NUM = eMP_NUM;
	}

	public int getACNT_NUM() {
		return ACNT_NUM;
	}

	public void setACNT_NUM(int aCNT_NUM) {
		ACNT_NUM = aCNT_NUM;
	}

	public String getACNT_id() {
		return ACNT_id;
	}

	public void setACNT_id(String aCNT_id) {
		ACNT_id = aCNT_id;
	}

	public String getACNT_pwd() {
		return ACNT_pwd;
	}

	public void setACNT_pwd(String aCNT_pwd) {
		ACNT_pwd = aCNT_pwd;
	}

	public int getACNT_level() {
		return ACNT_level;
	}

	public void setACNT_level(int aCNT_level) {
		ACNT_level = aCNT_level;
	}

	public int getEMP_NUM() {
		return EMP_NUM;
	}

	public void setEMP_NUM(int eMP_NUM) {
		EMP_NUM = eMP_NUM;
	}
	
	
	
	
	
	
	
}
