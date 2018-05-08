package com.jhta.groupware.work.vo;

import java.util.Date;

public class WorkandWorkfileVo {
	private int work_num;
	private Date work_sdate;
	private Date work_edate;
	private String work_content;
	private Date work_regdate;
	private int work_state;
	//0:진헝/1:승인/2:반려
	private int wtype_num;
	//0:근무/1:연차/2:반차/3:지각/4:야근/5:외근출장교육/6:경조사기타
	private String wfile_orgfilename;
	
	public WorkandWorkfileVo() {}

	public WorkandWorkfileVo(int work_num, Date work_sdate, Date work_edate, String work_content, Date work_regdate,
			int work_state, int wtype_num, String wfile_orgfilename) {
		super();
		this.work_num = work_num;
		this.work_sdate = work_sdate;
		this.work_edate = work_edate;
		this.work_content = work_content;
		this.work_regdate = work_regdate;
		this.work_state = work_state;
		this.wtype_num = wtype_num;
		this.wfile_orgfilename = wfile_orgfilename;
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

	public String getWork_content() {
		return work_content;
	}

	public void setWork_content(String work_content) {
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

	public int getWtype_num() {
		return wtype_num;
	}

	public void setWtype_num(int wtype_num) {
		this.wtype_num = wtype_num;
	}

	public String getWfile_orgfilename() {
		return wfile_orgfilename;
	}

	public void setWfile_orgfilename(String wfile_orgfilename) {
		this.wfile_orgfilename = wfile_orgfilename;
	}

	@Override
	public String toString() {
		return "WorkandWorkfileVo [work_num=" + work_num + ", work_sdate=" + work_sdate + ", work_edate=" + work_edate
				+ ", work_content=" + work_content + ", work_regdate=" + work_regdate + ", work_state=" + work_state
				+ ", wtype_num=" + wtype_num + ", wfile_orgfilename=" + wfile_orgfilename + "]";
	}
	
}
