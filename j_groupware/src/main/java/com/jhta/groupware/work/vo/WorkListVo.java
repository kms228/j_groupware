package com.jhta.groupware.work.vo;

import java.sql.Date;
//출퇴근내역
public class WorkListVo {
	private int wlist_num;//PK
	private Date wlist_start;//시작date
	private Date wlist_end;//마지막date
	private int wlist_type;//출퇴근타입
	/*(0.근무/1.연차/2.반차/3.지각/4.야근/5.외근/6.경조사(기타))
	 * 0. 근무 - 출근시간보다 빨리 출근버튼을 눌렀을 경우에만 wlist_start : 출근시간 / wlist_end : 퇴근시간
	 * 1. 연차 - wlist_start : 연차시작날짜 / wlist_end : 연차마지막날짜
	 * 2. 반차 - 반차날짜(오전/오후) - 반차(오전)일 경우 출근은 반차(오후) 시작전에 해야 지각처리 안됨  
	 * 3. 지각 - 출근시간과 계산 후 넣기
	 * 4. 야근 - 퇴근시간과 계산 후 넣기
	 * 5. 외근 - 외근시작날짜 / 외근마지막날짜
	 * 6. 경조사 - 경조사시작날짜 / 경조사 마지막날짜
	 * */
	private int emp_num;//사원번호(FK)
	
	public WorkListVo() {}

	public WorkListVo(int wlist_num, Date wlist_start, Date wlist_end, int wlist_type, int emp_num) {
		super();
		this.wlist_num = wlist_num;
		this.wlist_start = wlist_start;
		this.wlist_end = wlist_end;
		this.wlist_type = wlist_type;
		this.emp_num = emp_num;
	}

	public int getWlist_num() {
		return wlist_num;
	}

	public void setWlist_num(int wlist_num) {
		this.wlist_num = wlist_num;
	}

	public Date getWlist_start() {
		return wlist_start;
	}

	public void setWlist_start(Date wlist_start) {
		this.wlist_start = wlist_start;
	}

	public Date getWlist_end() {
		return wlist_end;
	}

	public void setWlist_end(Date wlist_end) {
		this.wlist_end = wlist_end;
	}

	public int getWlist_type() {
		return wlist_type;
	}

	public void setWlist_type(int wlist_type) {
		this.wlist_type = wlist_type;
	}

	public int getEmp_num() {
		return emp_num;
	}

	public void setEmp_num(int emp_num) {
		this.emp_num = emp_num;
	}

	@Override
	public String toString() {
		return "WorkListVo [wlist_num=" + wlist_num + ", wlist_start=" + wlist_start + ", wlist_end=" + wlist_end
				+ ", wlist_type=" + wlist_type + ", emp_num=" + emp_num + "]";
	}
	
	
}
