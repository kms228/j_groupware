package com.jhta.groupware.home.vo;

public class MyProfileVo {
	private String emp_name;
	private String emp_phone;
	private String emp_email;
	private int pst_num;
	private String pst_name;
	private int dept_num;
	private String dept_name;
	
	public MyProfileVo() {}
	public MyProfileVo(String emp_name, String emp_phone, String emp_email, int pst_num, String pst_name, int dept_num,
			String dept_name) {
		this.emp_name = emp_name;
		this.emp_phone = emp_phone;
		this.emp_email = emp_email;
		this.pst_num = pst_num;
		this.pst_name = pst_name;
		this.dept_num = dept_num;
		this.dept_name = dept_name;
	}

	public String getEmp_name() {
		return emp_name;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}

	public String getEmp_phone() {
		return emp_phone;
	}

	public void setEmp_phone(String emp_phone) {
		this.emp_phone = emp_phone;
	}

	public String getEmp_email() {
		return emp_email;
	}

	public void setEmp_email(String emp_email) {
		this.emp_email = emp_email;
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
}
