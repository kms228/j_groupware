package com.jhta.groupware.chat.vo;

import java.util.Date;

public class ChatVo {
	private String acnt_id;
	private String pst_name;
	private String emp_name;			
	private String message;
	private Date chatDate;
	
	public String getPst_name() {
		return pst_name;
	}
	public void setPst_name(String pst_name) {
		this.pst_name = pst_name;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Date getChatDate() {
		return chatDate;
	}
	public void setChatDate(Date chatDate) {
		this.chatDate = chatDate;
	}
	public String getAcnt_id() {
		return acnt_id;
	}
	public void setAcnt_id(String acnt_id) {
		this.acnt_id = acnt_id;
	}	
}
