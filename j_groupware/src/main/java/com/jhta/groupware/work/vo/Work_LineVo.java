package com.jhta.groupware.work.vo;

public class Work_LineVo {
	private int wline_num;
	private int wline_level;
	private int wline_state;
	private int work_num;
	private int emp_num;
	
	public Work_LineVo() {}

	public Work_LineVo(int wline_num, int wline_level, int wline_state, int work_num, int emp_num) {
		super();
		this.wline_num = wline_num;
		this.wline_level = wline_level;
		this.wline_state = wline_state;
		this.work_num = work_num;
		this.emp_num = emp_num;
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

	@Override
	public String toString() {
		return "Work_LineVo [wline_num=" + wline_num + ", wline_level=" + wline_level + ", wline_state=" + wline_state
				+ ", work_num=" + work_num + ", emp_num=" + emp_num + "]";
	}
	
	
}
