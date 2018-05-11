package com.jhta.groupware.work.vo;

public class SearchAdminVo {
	private int acnt_num;
	private String emp_name;
	private String dept_name;
	private String pst_name;
	private int emp_num;
	
	public SearchAdminVo() {}

	public SearchAdminVo(int acnt_num, String emp_name, String dept_name, String pst_name, int emp_num) {
		super();
		this.acnt_num = acnt_num;
		this.emp_name = emp_name;
		this.dept_name = dept_name;
		this.pst_name = pst_name;
		this.emp_num = emp_num;
	}

	public int getAcnt_num() {
		return acnt_num;
	}

	public void setAcnt_num(int acnt_num) {
		this.acnt_num = acnt_num;
	}

	public String getEmp_name() {
		return emp_name;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}

	public String getDept_name() {
		return dept_name;
	}

	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}

	public String getPst_name() {
		return pst_name;
	}

	public void setPst_name(String pst_name) {
		this.pst_name = pst_name;
	}

	public int getEmp_num() {
		return emp_num;
	}

	public void setEmp_num(int emp_num) {
		this.emp_num = emp_num;
	}

	@Override
	public String toString() {
		return "SearchAdminVo [acnt_num=" + acnt_num + ", emp_name=" + emp_name + ", dept_name=" + dept_name
				+ ", pst_name=" + pst_name + ", emp_num=" + emp_num + "]";
	}
	
}
