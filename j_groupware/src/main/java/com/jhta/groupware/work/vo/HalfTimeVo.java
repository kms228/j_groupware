package com.jhta.groupware.work.vo;

public class HalfTimeVo {
	private int htime_num;
	private int htime_start;
	private int htime_end;
	
	public HalfTimeVo() {}

	public HalfTimeVo(int htime_num, int htime_start, int htime_end) {
		super();
		this.htime_num = htime_num;
		this.htime_start = htime_start;
		this.htime_end = htime_end;
	}

	public int getHtime_num() {
		return htime_num;
	}

	public void setHtime_num(int htime_num) {
		this.htime_num = htime_num;
	}

	public int getHtime_start() {
		return htime_start;
	}

	public void setHtime_start(int htime_start) {
		this.htime_start = htime_start;
	}

	public int getHtime_end() {
		return htime_end;
	}

	public void setHtime_end(int htime_end) {
		this.htime_end = htime_end;
	}

	@Override
	public String toString() {
		return "HalfTimeVo [htime_num=" + htime_num + ", htime_start=" + htime_start + ", htime_end=" + htime_end + "]";
	}
	
	
}
