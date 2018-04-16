package com.jhta.groupware.calendar.vo;

public class Sc_FileVo {
	private int sf_num;
	private String sf_savefilename;
	private String sf_orgfilename;	
	private long sf_size;
	private int sch_num;
			
	public Sc_FileVo() {
	}
	public Sc_FileVo(int sf_num, String sf_savefilename, String sf_orgfilename, long sf_size, int sch_num) {
		this.sf_num = sf_num;
		this.sf_savefilename = sf_savefilename;
		this.sf_orgfilename = sf_orgfilename;
		this.sf_size = sf_size;
		this.sch_num = sch_num;
	}
	public int getSf_num() {
		return sf_num;
	}
	public void setSf_num(int sf_num) {
		this.sf_num = sf_num;
	}
	public String getSf_savefilename() {
		return sf_savefilename;
	}
	public void setSf_savefilename(String sf_savefilename) {
		this.sf_savefilename = sf_savefilename;
	}
	public String getSf_orgfilename() {
		return sf_orgfilename;
	}
	public void setSf_orgfilename(String sf_orgfilename) {
		this.sf_orgfilename = sf_orgfilename;
	}
	public long getSf_size() {
		return sf_size;
	}
	public void setSf_size(long sf_size) {
		this.sf_size = sf_size;
	}
	public int getSch_num() {
		return sch_num;
	}
	public void setSch_num(int sch_num) {
		this.sch_num = sch_num;
	}			
}
