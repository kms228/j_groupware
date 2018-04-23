package com.jhta.groupware.work.vo;

import java.util.Date;

public class HalfTimeVo {
	private int htime_num;
	private Date htime_start;
	private Date htime_end;
	private Date htime_start2;
	private Date htime_end2;
	
	public HalfTimeVo() {}

	public HalfTimeVo(int htime_num, Date htime_start, Date htime_end, Date htime_start2, Date htime_end2) {
		super();
		this.htime_num = htime_num;
		this.htime_start = htime_start;
		this.htime_end = htime_end;
		this.htime_start2 = htime_start2;
		this.htime_end2 = htime_end2;
	}

	public int getHtime_num() {
		return htime_num;
	}

	public void setHtime_num(int htime_num) {
		this.htime_num = htime_num;
	}

	public Date getHtime_start() {
		return htime_start;
	}

	public void setHtime_start(Date htime_start) {
		this.htime_start = htime_start;
	}

	public Date getHtime_end() {
		return htime_end;
	}

	public void setHtime_end(Date htime_end) {
		this.htime_end = htime_end;
	}

	public Date getHtime_start2() {
		return htime_start2;
	}

	public void setHtime_start2(Date htime_start2) {
		this.htime_start2 = htime_start2;
	}

	public Date getHtime_end2() {
		return htime_end2;
	}

	public void setHtime_end2(Date htime_end2) {
		this.htime_end2 = htime_end2;
	}

	@Override
	public String toString() {
		return "HalfTimeVo [htime_num=" + htime_num + ", htime_start=" + htime_start + ", htime_end=" + htime_end
				+ ", htime_start2=" + htime_start2 + ", htime_end2=" + htime_end2 + "]";
	}

	
	
}
