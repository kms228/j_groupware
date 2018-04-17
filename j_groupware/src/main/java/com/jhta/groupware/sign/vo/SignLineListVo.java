package com.jhta.groupware.sign.vo;

public class SignLineListVo {
	private int dept_num;
	private String dept_name;
	private int emp_num;
	private String emp_name;
	private int pst_num;
	private String pst_name;
	public SignLineListVo(int dept_num, String dept_name, int emp_num, String emp_name, int pst_num, String pst_name) {
		super();
		this.dept_num = dept_num;
		this.dept_name = dept_name;
		this.emp_num = emp_num;
		this.emp_name = emp_name;
		this.pst_num = pst_num;
		this.pst_name = pst_name;
	}
	public SignLineListVo() {
		super();
	}
	public int getDept_num() {
		return dept_num;
	}
	public void setDept_num(int dept_num) {
		this.dept_num = dept_num;
	}
	public String getDept_name() {
		return dept_name;
	}
	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}
	public int getEmp_num() {
		return emp_num;
	}
	public void setEmp_num(int emp_num) {
		this.emp_num = emp_num;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public int getPst_num() {
		return pst_num;
	}
	public void setPst_num(int pst_num) {
		this.pst_num = pst_num;
	}
	public String getPst_name() {
		return pst_name;
	}
	public void setPst_name(String pst_name) {
		this.pst_name = pst_name;
	}			
}
