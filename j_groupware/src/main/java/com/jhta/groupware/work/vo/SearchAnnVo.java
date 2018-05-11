package com.jhta.groupware.work.vo;

public class SearchAnnVo {
	private int ann_num;
	private int ann_total;
	private int ann_use;
	private int emp_num;
	private String dept_name;
	private int dept_num;
	private int ann_ann;
	private String emp_name;
	private String acnt_id;
	
	public SearchAnnVo() {}

	public SearchAnnVo(int ann_num, int ann_total, int ann_use, int emp_num, String dept_name, int dept_num,
			int ann_ann, String emp_name, String acnt_id) {
		super();
		this.ann_num = ann_num;
		this.ann_total = ann_total;
		this.ann_use = ann_use;
		this.emp_num = emp_num;
		this.dept_name = dept_name;
		this.dept_num = dept_num;
		this.ann_ann = ann_ann;
		this.emp_name = emp_name;
		this.acnt_id = acnt_id;
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

	public String getDept_name() {
		return dept_name;
	}

	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}

	public int getDept_num() {
		return dept_num;
	}

	public void setDept_num(int dept_num) {
		this.dept_num = dept_num;
	}

	public int getAnn_ann() {
		return ann_ann;
	}

	public void setAnn_ann(int ann_ann) {
		this.ann_ann = ann_ann;
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

	@Override
	public String toString() {
		return "SearchAnnVo [ann_num=" + ann_num + ", ann_total=" + ann_total + ", ann_use=" + ann_use + ", emp_num="
				+ emp_num + ", dept_name=" + dept_name + ", dept_num=" + dept_num + ", ann_ann=" + ann_ann
				+ ", emp_name=" + emp_name + ", acnt_id=" + acnt_id + "]";
	}
	
}
