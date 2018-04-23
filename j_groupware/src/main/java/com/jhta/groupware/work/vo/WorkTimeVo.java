package com.jhta.groupware.work.vo;

import java.util.Date;

public class WorkTimeVo {
	private int wtime_num;
	private Date wtime_start;
	private Date wtime_end;
	
	public WorkTimeVo() {}

	public WorkTimeVo(int wtime_num, Date wtime_start, Date wtime_end) {
		super();
		this.wtime_num = wtime_num;
		this.wtime_start = wtime_start;
		this.wtime_end = wtime_end;
	}

	public int getWtime_num() {
		return wtime_num;
	}

	public void setWtime_num(int wtime_num) {
		this.wtime_num = wtime_num;
	}

	public Date getWtime_start() {
		return wtime_start;
	}

	public void setWtime_start(Date wtime_start) {
		this.wtime_start = wtime_start;
	}

	public Date getWtime_end() {
		return wtime_end;
	}

	public void setWtime_end(Date wtime_end) {
		this.wtime_end = wtime_end;
	}

	@Override
	public String toString() {
		return "WorkTimeVo [wtime_num=" + wtime_num + ", wtime_start=" + wtime_start + ", wtime_end=" + wtime_end + "]";
	}
	
	
}
