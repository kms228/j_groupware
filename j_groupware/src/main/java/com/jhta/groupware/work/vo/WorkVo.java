package com.jhta.groupware.work.vo;

import java.sql.Date;

public class WorkVo {
	private int work_num;
	private Date work_sdate;
	private Date work_edate;
	private int work_content;
	private Date work_regdate;
	private int work_state;
	private int emp_num;
	private int wtype_num;
	
	public WorkVo() {}

	public WorkVo(int work_num, Date work_sdate, Date work_edate, int work_content, Date work_regdate, int work_state,
			int emp_num, int wtype_num) {
		super();
		this.work_num = work_num;
		this.work_sdate = work_sdate;
		this.work_edate = work_edate;
		this.work_content = work_content;
		this.work_regdate = work_regdate;
		this.work_state = work_state;
		this.emp_num = emp_num;
		this.wtype_num = wtype_num;
	}

	public int getWork_num() {
		return work_num;
	}

	public void setWork_num(int work_num) {
		this.work_num = work_num;
	}

	public Date getWork_sdate() {
		return work_sdate;
	}

	public void setWork_sdate(Date work_sdate) {
		this.work_sdate = work_sdate;
	}

	public Date getWork_edate() {
		return work_edate;
	}

	public void setWork_edate(Date work_edate) {
		this.work_edate = work_edate;
	}

	public int getWork_content() {
		return work_content;
	}

	public void setWork_content(int work_content) {
		this.work_content = work_content;
	}

	public Date getWork_regdate() {
		return work_regdate;
	}

	public void setWork_regdate(Date work_regdate) {
		this.work_regdate = work_regdate;
	}

	public int getWork_state() {
		return work_state;
	}

	public void setWork_state(int work_state) {
		this.work_state = work_state;
	}

	public int getEmp_num() {
		return emp_num;
	}

	public void setEmp_num(int emp_num) {
		this.emp_num = emp_num;
	}

	public int getWtype_num() {
		return wtype_num;
	}

	public void setWtype_num(int wtype_num) {
		this.wtype_num = wtype_num;
	}

	@Override
	public String toString() {
		return "WorkVo [work_num=" + work_num + ", work_sdate=" + work_sdate + ", work_edate=" + work_edate
				+ ", work_content=" + work_content + ", work_regdate=" + work_regdate + ", work_state=" + work_state
				+ ", emp_num=" + emp_num + ", wtype_num=" + wtype_num + "]";
	}
	
}
