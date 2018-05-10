package com.jhta.groupware.work.vo;

public class AnnInfoVo {
	private int emp_num;
	private String emp_name;
	private String acnt_id;
	private int ann_use;
	private int ann_total;
	
	public AnnInfoVo() {}

	public AnnInfoVo(int emp_num, String emp_name, String acnt_id, int ann_use, int ann_total) {
		super();
		this.emp_num = emp_num;
		this.emp_name = emp_name;
		this.acnt_id = acnt_id;
		this.ann_use = ann_use;
		this.ann_total = ann_total;
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

	public String getAcnt_id() {
		return acnt_id;
	}

	public void setAcnt_id(String acnt_id) {
		this.acnt_id = acnt_id;
	}

	public int getAnn_use() {
		return ann_use;
	}

	public void setAnn_use(int ann_use) {
		this.ann_use = ann_use;
	}

	public int getAnn_total() {
		return ann_total;
	}

	public void setAnn_total(int ann_total) {
		this.ann_total = ann_total;
	}

	@Override
	public String toString() {
		return "AnnInfoVo [emp_num=" + emp_num + ", emp_name=" + emp_name + ", acnt_id=" + acnt_id + ", ann_use="
				+ ann_use + ", ann_total=" + ann_total + "]";
	}
	
}
