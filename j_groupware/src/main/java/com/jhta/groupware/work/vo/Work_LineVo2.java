package com.jhta.groupware.work.vo;

public class Work_LineVo2 {
	private int wline_num;
	private int wline_level;
	private int wline_state;
	private int work_num;
	private int emp_num;
	private String emp_name;
	private String pst_name;
	private String dept_name;
	private String wline_content;
	
	public Work_LineVo2() {}

	public Work_LineVo2(int wline_num, int wline_level, int wline_state, int work_num, int emp_num, String emp_name,
			String pst_name, String dept_name, String wline_content) {
		super();
		this.wline_num = wline_num;
		this.wline_level = wline_level;
		this.wline_state = wline_state;
		this.work_num = work_num;
		this.emp_num = emp_num;
		this.emp_name = emp_name;
		this.pst_name = pst_name;
		this.dept_name = dept_name;
		this.wline_content = wline_content;
	}

	public int getWline_num() {
		return wline_num;
	}

	public void setWline_num(int wline_num) {
		this.wline_num = wline_num;
	}

	public int getWline_level() {
		return wline_level;
	}

	public void setWline_level(int wline_level) {
		this.wline_level = wline_level;
	}

	public int getWline_state() {
		return wline_state;
	}

	public void setWline_state(int wline_state) {
		this.wline_state = wline_state;
	}

	public int getWork_num() {
		return work_num;
	}

	public void setWork_num(int work_num) {
		this.work_num = work_num;
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

	public String getPst_name() {
		return pst_name;
	}

	public void setPst_name(String pst_name) {
		this.pst_name = pst_name;
	}

	public String getDept_name() {
		return dept_name;
	}

	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}

	public String getWline_content() {
		return wline_content;
	}

	public void setWline_content(String wline_content) {
		this.wline_content = wline_content;
	}

	@Override
	public String toString() {
		return "Work_LineVo2 [wline_num=" + wline_num + ", wline_level=" + wline_level + ", wline_state=" + wline_state
				+ ", work_num=" + work_num + ", emp_num=" + emp_num + ", emp_name=" + emp_name + ", pst_name="
				+ pst_name + ", dept_name=" + dept_name + ", wline_content=" + wline_content + "]";
	}
	
}
