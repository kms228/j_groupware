package com.jhta.groupware.work.vo;

public class Work_FileVo {
	private int wfile_num;
	private String wfile_savefilename;
	private String wfile_orgfilename;
	private long wfile_size;
	private int work_num;
	
	public Work_FileVo() {}

	public Work_FileVo(int wfile_num, String wfile_savefilename, String wfile_orgfilename, long wfile_size,
			int work_num) {
		super();
		this.wfile_num = wfile_num;
		this.wfile_savefilename = wfile_savefilename;
		this.wfile_orgfilename = wfile_orgfilename;
		this.wfile_size = wfile_size;
		this.work_num = work_num;
	}

	public int getWfile_num() {
		return wfile_num;
	}

	public void setWfile_num(int wfile_num) {
		this.wfile_num = wfile_num;
	}

	public String getWfile_savefilename() {
		return wfile_savefilename;
	}

	public void setWfile_savefilename(String wfile_savefilename) {
		this.wfile_savefilename = wfile_savefilename;
	}

	public String getWfile_orgfilename() {
		return wfile_orgfilename;
	}

	public void setWfile_orgfilename(String wfile_orgfilename) {
		this.wfile_orgfilename = wfile_orgfilename;
	}

	public long getWfile_size() {
		return wfile_size;
	}

	public void setWfile_size(long wfile_size) {
		this.wfile_size = wfile_size;
	}

	public int getWork_num() {
		return work_num;
	}

	public void setWork_num(int work_num) {
		this.work_num = work_num;
	}

	@Override
	public String toString() {
		return "Work_FileVo [wfile_num=" + wfile_num + ", wfile_savefilename=" + wfile_savefilename
				+ ", wfile_orgfilename=" + wfile_orgfilename + ", wfile_size=" + wfile_size + ", work_num=" + work_num
				+ "]";
	}
	
}
