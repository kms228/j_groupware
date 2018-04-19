package com.jhta.groupware.sign.vo;

public class SdocLineVo {
	private int sline_num;
	private int sline_level;
	private int sline_state;
	private int emp_num;
	private int sdoc_num;
	//상세보기 결재라인자 정보 추가
	private String emp_name;
	private String pst_name;
	
	
	public SdocLineVo(String emp_name, String pst_name) {
		super();
		this.emp_name = emp_name;
		this.pst_name = pst_name;
	}
	public SdocLineVo(int sline_num, int sline_level, int sline_state, int emp_num, int sdoc_num, String emp_name,
			String pst_name) {
		super();
		this.sline_num = sline_num;
		this.sline_level = sline_level;
		this.sline_state = sline_state;
		this.emp_num = emp_num;
		this.sdoc_num = sdoc_num;
		this.emp_name = emp_name;
		this.pst_name = pst_name;
	}
	public SdocLineVo(int sline_num, int sline_level, int sline_state, int emp_num, int sdoc_num) {
		super();
		this.sline_num = sline_num;
		this.sline_level = sline_level;
		this.sline_state = sline_state;
		this.emp_num = emp_num;
		this.sdoc_num = sdoc_num;
	}
	public SdocLineVo() {
		super();
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
	public int getSline_num() {
		return sline_num;
	}
	public void setSline_num(int sline_num) {
		this.sline_num = sline_num;
	}
	public int getSline_level() {
		return sline_level;
	}
	public void setSline_level(int sline_level) {
		this.sline_level = sline_level;
	}
	public int getSline_state() {
		return sline_state;
	}
	public void setSline_state(int sline_state) {
		this.sline_state = sline_state;
	}
	public int getEmp_num() {
		return emp_num;
	}
	public void setEmp_num(int emp_num) {
		this.emp_num = emp_num;
	}
	public int getSdoc_num() {
		return sdoc_num;
	}
	public void setSdoc_num(int sdoc_num) {
		this.sdoc_num = sdoc_num;
	}
	@Override
	public String toString() {
		return "SdocLineVo [sline_num=" + sline_num + ", sline_level=" + sline_level + ", sline_state=" + sline_state
				+ ", emp_num=" + emp_num + ", sdoc_num=" + sdoc_num + ", emp_name=" + emp_name + ", pst_name="
				+ pst_name + "]";
	}
	
	
}
