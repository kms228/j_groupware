package com.jhta.groupware.work.vo;

public class AnnualVo {
	private int ann_num;
	private int ann_total;
	private int ann_use;
	private int emp_num;
	
	public AnnualVo() {}

	public AnnualVo(int ann_num, int ann_total, int ann_use, int emp_num) {
		super();
		this.ann_num = ann_num;
		this.ann_total = ann_total;
		this.ann_use = ann_use;
		this.emp_num = emp_num;
	}

	public int getAnn_num() {
		return ann_num;
	}

	public void setAnn_num(int ann_num) {
		this.ann_num = ann_num;
	}

	public int getAnn_total() {
		return ann_total;
	}

	public void setAnn_total(int ann_total) {
		this.ann_total = ann_total;
	}

	public int getAnn_use() {
		return ann_use;
	}

	public void setAnn_use(int ann_use) {
		this.ann_use = ann_use;
	}

	public int getEmp_num() {
		return emp_num;
	}

	public void setEmp_num(int emp_num) {
		this.emp_num = emp_num;
	}

	@Override
	public String toString() {
		return "AnnualVo [ann_num=" + ann_num + ", ann_total=" + ann_total + ", ann_use=" + ann_use + ", emp_num="
				+ emp_num + "]";
	}
	
}
