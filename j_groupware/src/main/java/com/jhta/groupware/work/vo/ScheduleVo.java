package com.jhta.groupware.work.vo;

import java.util.Date;

public class ScheduleVo {
	private int emp_num;
	private String emp_name;
	private int work_num;
	private Date work_edate;
	private Date work_sdate;
	private String work_content;
	private int wtype_num;
	private String sdate;
	private String edate;
	private String content;
	private int work_state;
	
	public ScheduleVo() {}

	public ScheduleVo(int emp_num, String emp_name, int work_num, Date work_edate, Date work_sdate, String work_content,
			int wtype_num, String sdate, String edate, String content, int work_state) {
		super();
		this.emp_num = emp_num;
		this.emp_name = emp_name;
		this.work_num = work_num;
		this.work_edate = work_edate;
		this.work_sdate = work_sdate;
		this.work_content = work_content;
		this.wtype_num = wtype_num;
		this.sdate = sdate;
		this.edate = edate;
		this.content = content;
		this.work_state = work_state;
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

	public int getWork_num() {
		return work_num;
	}

	public void setWork_num(int work_num) {
		this.work_num = work_num;
	}

	public Date getWork_edate() {
		return work_edate;
	}

	public void setWork_edate(Date work_edate) {
		this.work_edate = work_edate;
	}

	public Date getWork_sdate() {
		return work_sdate;
	}

	public void setWork_sdate(Date work_sdate) {
		this.work_sdate = work_sdate;
	}

	public String getWork_content() {
		return work_content;
	}

	public void setWork_content(String work_content) {
		this.work_content = work_content;
	}

	public int getWtype_num() {
		return wtype_num;
	}

	public void setWtype_num(int wtype_num) {
		this.wtype_num = wtype_num;
	}

	public String getSdate() {
		return sdate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

	public String getEdate() {
		return edate;
	}

	public void setEdate(String edate) {
		this.edate = edate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getWork_state() {
		return work_state;
	}

	public void setWork_state(int work_state) {
		this.work_state = work_state;
	}

	@Override
	public String toString() {
		return "ScheduleVo [emp_num=" + emp_num + ", emp_name=" + emp_name + ", work_num=" + work_num + ", work_edate="
				+ work_edate + ", work_sdate=" + work_sdate + ", work_content=" + work_content + ", wtype_num="
				+ wtype_num + ", sdate=" + sdate + ", edate=" + edate + ", content=" + content + ", work_state="
				+ work_state + "]";
	}
	
}
